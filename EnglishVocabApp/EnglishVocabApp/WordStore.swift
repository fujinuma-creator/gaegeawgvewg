import Foundation
import SwiftUI
import Combine
@preconcurrency import UserNotifications

@MainActor
final class WordStore: ObservableObject {
    @Published private(set) var words: [Word] = []
    @Published private(set) var stats = StudyStats()

    private let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    private var libraryURL: URL { docs.appendingPathComponent("englishvocab_library.json") }
    private var statsURL: URL { docs.appendingPathComponent("englishvocab_stats.json") }
    private var backupURL: URL { docs.appendingPathComponent("englishvocab_library.backup.json") }

    init() {
        load()
        loadSoundWords()
        // Keep a second copy from the last successful start-up.
        if let data = try? Data(contentsOf: libraryURL) {
            try? data.write(to: backupURL, options: .atomic)
        }
    }

    // MARK: - Persistence
    //
    // The built-in vocabulary (4,000+ words with examples) lives in the app
    // binary, so the library file only stores each built-in word's *progress*
    // (id + review state) plus the full entries of words the user added. That
    // keeps every save small and lets updates ship new words without
    // touching anyone's progress.

    private struct WordProgress: Codable {
        let id: String
        var stage: Int
        var reviewCount: Int
        var nextReviewDate: Date
        var lastReviewedDate: Date?
        var createdAt: Date
        var checked: Bool
        var learned: Bool

        init(_ w: Word) {
            id = w.id; stage = w.stage; reviewCount = w.reviewCount; nextReviewDate = w.nextReviewDate
            lastReviewedDate = w.lastReviewedDate; createdAt = w.createdAt; checked = w.checked; learned = w.learned
        }

        func apply(to w: inout Word) {
            w.stage = stage; w.reviewCount = reviewCount; w.nextReviewDate = nextReviewDate
            w.lastReviewedDate = lastReviewedDate; w.createdAt = createdAt; w.checked = checked; w.learned = learned
        }
    }

    private struct LibraryFile: Codable {
        var version = 3
        var progress: [WordProgress]
        var userWords: [Word]
    }

    private struct BackupFile: Codable {
        var app = "KOTOBA英語"
        var version = 3
        var exportedAt = Date()
        var progress: [WordProgress]
        var userWords: [Word]
        var stats: StudyStats
    }

    private static func isUserWord(_ w: Word) -> Bool { w.id.hasPrefix("u-") }

    private func load() {
        let dec = JSONDecoder(); dec.dateDecodingStrategy = .iso8601
        var source = try? Data(contentsOf: libraryURL)
        if source == nil { source = try? Data(contentsOf: backupURL) }
        var file: LibraryFile? = nil
        if let data = source {
            file = try? dec.decode(LibraryFile.self, from: data)
            if file == nil, let backup = try? Data(contentsOf: backupURL) {
                file = try? dec.decode(LibraryFile.self, from: backup)
            }
            if file == nil {
                let stamp = Int(Date().timeIntervalSince1970)
                try? data.write(to: docs.appendingPathComponent("englishvocab_library.unreadable-\(stamp).json"))
            }
        }
        words = Self.build(progress: file?.progress ?? [], userWords: file?.userWords ?? [])
        if let data = try? Data(contentsOf: statsURL),
           let s = try? dec.decode(StudyStats.self, from: data) {
            stats = s
        }
    }

    /// Built-in words with saved progress applied, followed by the user's own words.
    private static func build(progress: [WordProgress], userWords: [Word]) -> [Word] {
        var byId: [String: WordProgress] = [:]
        for p in progress { byId[p.id] = p }
        var out = SeedWords.all
        for i in out.indices {
            if let p = byId[out[i].id] { p.apply(to: &out[i]) }
        }
        let seedIds = Set(out.map { $0.id })
        out.append(contentsOf: userWords.filter { isUserWord($0) && !seedIds.contains($0.id) })
        return out
    }

    func save() {
        let enc = JSONEncoder(); enc.dateEncodingStrategy = .iso8601
        let file = LibraryFile(progress: words.filter { !Self.isUserWord($0) }.map(WordProgress.init),
                               userWords: words.filter { Self.isUserWord($0) })
        if let data = try? enc.encode(file) { try? data.write(to: libraryURL, options: .atomic) }
        if let data = try? enc.encode(stats) { try? data.write(to: statsURL, options: .atomic) }
    }

    // MARK: - バックアップ（書き出し・読み込み）
    //
    // The backup carries progress for built-in words (ids and review state
    // only — no meanings or examples) plus the full entries of words the user
    // added themselves, so it restores everything on a new phone but can't
    // be used to extract the word list.

    func exportBackup() -> URL? {
        let file = BackupFile(progress: words.filter { !Self.isUserWord($0) }.map(WordProgress.init),
                              userWords: words.filter { Self.isUserWord($0) }, stats: stats)
        let enc = JSONEncoder(); enc.dateEncodingStrategy = .iso8601
        guard let data = try? enc.encode(file) else { return nil }
        let f = DateFormatter(); f.dateFormat = "yyyyMMdd"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("KOTOBA英語_バックアップ_\(f.string(from: Date())).json")
        try? data.write(to: url, options: .atomic)
        return url
    }

    /// Restores from a backup: progress is applied to built-in words, the
    /// user's own words are added/updated. Returns (restored, added).
    func importBackup(from url: URL) throws -> (Int, Int) {
        let scoped = url.startAccessingSecurityScopedResource()
        defer { if scoped { url.stopAccessingSecurityScopedResource() } }
        let data = try Data(contentsOf: url)
        let dec = JSONDecoder(); dec.dateDecodingStrategy = .iso8601
        let file = try dec.decode(BackupFile.self, from: data)
        var restored = 0, added = 0
        for p in file.progress {
            guard let i = words.firstIndex(where: { $0.id == p.id }) else { continue }
            p.apply(to: &words[i])
            restored += 1
        }
        for w in file.userWords where Self.isUserWord(w) {
            if let i = words.firstIndex(where: { $0.id == w.id }) { words[i] = w } else { words.append(w); added += 1 }
            restored += 1
        }
        stats.studiedDays.formUnion(file.stats.studiedDays)
        for (k, v) in file.stats.dailySeconds { stats.dailySeconds[k] = max(stats.dailySeconds[k] ?? 0, v) }
        for (k, v) in file.stats.dailyReviews { stats.dailyReviews[k] = max(stats.dailyReviews[k] ?? 0, v) }
        save()
        return (restored, added)
    }

    /// Words the user added (not part of the built-in list).
    var userWordCount: Int { words.filter { Self.isUserWord($0) }.count }

    // MARK: - Derived collections

    var totalCount: Int { words.count }
    var learnedCount: Int { words.filter { $0.learned }.count }
    var checkedWords: [Word] { words.filter { $0.checked } }

    /// 今日の100語: a different random hundred every day (same all day).
    func dailyWords(count: Int = 100) -> [Word] {
        let day = Int(Date().startOfDay.timeIntervalSince1970 / 86_400)
        var rng = SplitMix64(seed: UInt64(bitPattern: Int64(day &* 7_919 &+ 17)))
        var list = words.filter { !$0.learned }.sorted { $0.id < $1.id }
        list.shuffle(using: &rng)
        return Array(list.prefix(count))
    }

    /// Words due on or before the end of `date` (today also includes overdue).
    func dueWords(on date: Date = Date()) -> [Word] {
        let day = date.startOfDay
        let end = day.adding(days: 1)
        if day <= Date().startOfDay {
            return words.filter { !$0.learned && $0.nextReviewDate < end }
        }
        return words.filter { !$0.learned && $0.nextReviewDate >= day && $0.nextReviewDate < end }
    }

    /// Today's review set, sorted by stage then word, capped by the daily limit.
    func todayReviewWords(limit: Int) -> [Word] {
        let due = dueWords().sorted {
            if $0.stage != $1.stage { return $0.stage < $1.stage }
            return $0.nextReviewDate < $1.nextReviewDate
        }
        return limit > 0 ? Array(due.prefix(limit)) : due
    }

    /// Per-stage breakdown of today's review set. Uses the same capped list
    /// as the 今日の復習 total so the numbers always add up.
    func stageCounts(limit: Int) -> [ReviewStage: Int] {
        var r: [ReviewStage: Int] = [:]
        for w in todayReviewWords(limit: limit) { r[w.reviewStage, default: 0] += 1 }
        return r
    }

    /// Words scheduled for a future day (not today, not past).
    func scheduledWords(on date: Date) -> [Word] {
        let day = date.startOfDay, end = day.adding(days: 1)
        return words.filter { !$0.learned && $0.nextReviewDate >= day && $0.nextReviewDate < end }
    }

    /// Words whose most recent review happened on that (past) day.
    func reviewedWords(on date: Date) -> [Word] {
        let day = date.startOfDay, end = day.adding(days: 1)
        return words.filter { ($0.lastReviewedDate.map { $0 >= day && $0 < end }) ?? false }
    }

    /// Calendar numbers for each day of the month:
    /// - past days: how many cards were answered that day
    /// - today: today's review set (capped by the daily limit)
    /// - future days: words scheduled for that day
    func calendarCounts(month: Date, limit: Int) -> [Int: Int] {
        let cal = Calendar.current
        guard let range = cal.range(of: .day, in: .month, for: month),
              let first = cal.date(from: cal.dateComponents([.year, .month], from: month)) else { return [:] }
        let today = Date().startOfDay
        var r: [Int: Int] = [:]
        for d in range {
            let day = first.adding(days: d - 1)
            let n: Int
            if day < today { n = stats.reviews(on: day) }
            else if day == today { n = todayReviewWords(limit: limit).count }
            else { n = scheduledWords(on: day).count }
            if n > 0 { r[d] = n }
        }
        return r
    }

    // MARK: - Mutations

    func toggleChecked(_ word: Word) {
        guard let i = words.firstIndex(where: { $0.id == word.id }) else { return }
        words[i].checked.toggle()
        save()
    }

    func clearChecked() {
        for i in words.indices { words[i].checked = false }
        save()
    }

    /// 思い出せた → next stage; 思い出せなかった → back to 1日後.
    func record(remembered: Bool, for word: Word) {
        guard let i = words.firstIndex(where: { $0.id == word.id }) else { return }
        var w = words[i]
        let now = Date()
        w.reviewCount += 1
        w.lastReviewedDate = now
        if remembered {
            if w.reviewStage == .month1 {
                w.learned = true
                w.nextReviewDate = now.startOfDay.adding(days: 60)
            } else {
                let interval = w.reviewStage.intervalDays
                w.stage = w.reviewStage.next.rawValue
                w.nextReviewDate = now.startOfDay.adding(days: interval)
            }
        } else {
            w.stage = ReviewStage.day1.rawValue
            w.learned = false
            w.nextReviewDate = now.startOfDay.adding(days: 1)
        }
        words[i] = w
        stats.markToday()
        stats.addReview(on: now)
        save()
    }

    /// True if a word with the same English text (ignoring case, spaces and punctuation) exists.
    func contains(word text: String) -> Bool {
        let key = Self.normalize(text)
        return words.contains { Self.normalize($0.word) == key }
    }

    private static func normalize(_ s: String) -> String {
        s.lowercased().filter { $0.isLetter || $0.isNumber }
    }

    /// Adds a user / AI-made word at the start of the review schedule.
    @discardableResult
    func addUserWord(_ w: Word) -> Bool {
        guard !contains(word: w.word) else { return false }
        words.append(w)
        save()
        return true
    }

    func replaceExamples(for wordId: String, with examples: [Example], append: Bool) {
        guard let i = words.firstIndex(where: { $0.id == wordId }) else { return }
        if append { words[i].examples.append(contentsOf: examples) } else { words[i].examples = examples }
        save()
    }

    func markStudied() {
        stats.markToday()
        save()
    }

    // MARK: - 発音の単語（AIで増やした分）

    @Published private(set) var generatedSoundWords: [String: [SoundWord]] = [:]
    private var soundWordsURL: URL { docs.appendingPathComponent("englishvocab_sound_words.json") }

    /// Built-in + generated words for a sound, without duplicates.
    func soundWords(for item: SoundItem) -> [SoundWord] {
        var seen = Set<String>()
        var out: [SoundWord] = []
        for w in item.moreExamples + (PronunciationSeed.pools[item.id] ?? []) + (generatedSoundWords[item.id] ?? []) {
            if seen.insert(w.id).inserted { out.append(w) }
        }
        return out
    }

    func addGeneratedSoundWords(_ words: [SoundWord], for item: SoundItem) {
        var list = generatedSoundWords[item.id] ?? []
        let have = Set(soundWords(for: item).map { $0.id })
        list.append(contentsOf: words.filter { !have.contains($0.id) })
        generatedSoundWords[item.id] = list
        if let data = try? JSONEncoder().encode(generatedSoundWords) {
            try? data.write(to: soundWordsURL, options: .atomic)
        }
    }

    private func loadSoundWords() {
        if let data = try? Data(contentsOf: soundWordsURL),
           let d = try? JSONDecoder().decode([String: [SoundWord]].self, from: data) {
            generatedSoundWords = d
        }
    }

    // MARK: - 学習時間（学習画面にいる間だけ数える）

    private var studyStart: Date? = nil
    private var studyScreenCount = 0

    func studyScreenAppeared() {
        studyScreenCount += 1
        if studyStart == nil { studyStart = Date() }
    }

    func studyScreenDisappeared() {
        studyScreenCount = max(0, studyScreenCount - 1)
        if studyScreenCount == 0 { flushStudyTime() }
    }

    /// App went to the background: bank the time so far, keep the screen count.
    func pauseStudy() { flushStudyTime() }

    /// App came back: restart the clock if a study screen is still showing.
    func resumeStudy() {
        if studyScreenCount > 0 && studyStart == nil { studyStart = Date() }
    }

    private func flushStudyTime() {
        guard let start = studyStart else { return }
        studyStart = nil
        let now = Date()
        guard now > start, now.timeIntervalSince(start) < 6 * 3600 else { return }
        // Split a session that crosses midnight so each day gets its own time.
        var from = start
        while from < now {
            let dayEnd = from.startOfDay.adding(days: 1)
            let to = min(dayEnd, now)
            stats.addSeconds(to.timeIntervalSince(from), on: from)
            if stats.seconds(on: from) >= 60 { stats.studiedDays.insert(from.startOfDay.timeIntervalSince1970) }
            from = to
        }
        save()
    }

    /// Study time for a day including the session that is running right now
    /// (the clock only banks time when a study screen closes).
    func liveSeconds(on date: Date) -> TimeInterval {
        var s = stats.seconds(on: date)
        if let start = studyStart {
            let day = date.startOfDay, end = day.adding(days: 1)
            let from = max(start, day), to = min(Date(), end)
            if to > from { s += to.timeIntervalSince(from) }
        }
        return s
    }

    /// 累計学習時間: every banked day plus the session running right now.
    func totalStudySeconds() -> TimeInterval {
        var s = stats.totalSeconds + stats.dailySeconds.values.reduce(0, +)
        if let start = studyStart { s += max(0, Date().timeIntervalSince(start)) }
        return s
    }

    /// 学習記録をリセット: progress and statistics only, words stay.
    func resetProgress() {
        for i in words.indices {
            words[i].stage = 0
            words[i].reviewCount = 0
            words[i].nextReviewDate = Date().startOfDay
            words[i].lastReviewedDate = nil
            words[i].checked = false
            words[i].learned = false
        }
        stats = StudyStats()
        save()
    }

    // MARK: - CSV export（チェックした単語・自分で追加した単語のみ）

    /// Rows allowed in the CSV: words the user checked + words the user added.
    /// The built-in content (examples, 定義, 関連表現 …) is never exported.
    var csvExportableWords: [Word] {
        words.filter { $0.checked || Self.isUserWord($0) }
            .sorted { $0.createdAt < $1.createdAt }
    }

    func exportCSV() -> URL? {
        let list = csvExportableWords
        guard !list.isEmpty else { return nil }
        func q(_ s: String) -> String { "\"" + s.replacingOccurrences(of: "\"", with: "\"\"") + "\"" }
        var rows = ["英語,発音記号,日本語,区分"]
        for w in list {
            let kind = Self.isUserWord(w) ? "自分で追加" : "チェック"
            rows.append([q(w.word), q(w.ipaDisplay), q(w.japanese), q(kind)].joined(separator: ","))
        }
        let f = DateFormatter(); f.dateFormat = "yyyyMMdd"
        let url = FileManager.default.temporaryDirectory.appendingPathComponent("KOTOBA英語_単語_\(f.string(from: Date())).csv")
        guard let data = ("\u{FEFF}" + rows.joined(separator: "\n")).data(using: .utf8) else { return nil }
        try? data.write(to: url, options: .atomic)
        return url
    }

    // MARK: - Notifications (復習の通知)

    func scheduleNotification(settings: AppSettings) {
        let center = UNUserNotificationCenter.current()
        center.removePendingNotificationRequests(withIdentifiers: ["englishvocab.daily"])
        guard settings.notifyEnabled else { return }
        let hour = settings.notifyHour, minute = settings.notifyMinute
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            guard granted else { return }
            let content = UNMutableNotificationContent()
            content.title = "KOTOBA英語"
            content.body = "今日の復習の時間です。忘れる前にもう一度。"
            content.sound = .default
            var comps = DateComponents()
            comps.hour = hour
            comps.minute = minute
            let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: true)
            UNUserNotificationCenter.current().add(UNNotificationRequest(identifier: "englishvocab.daily", content: content, trigger: trigger))
        }
    }
}
