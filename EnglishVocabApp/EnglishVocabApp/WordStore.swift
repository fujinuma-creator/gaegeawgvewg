import Foundation
import SwiftUI

@MainActor
final class WordStore: ObservableObject {
    @Published private(set) var words: [Word] = []

    /// AI-assisted study logs keyed by example sentence id (UUID string).
    /// Stores the on-demand grammar explanation Gemini wrote and the user's
    /// past composition attempts with AI corrections. Persisted to a
    /// separate JSON file so it survives example regeneration if the user
    /// hasn't replaced the example yet.
    @Published private(set) var studyLogs: [String: ExampleStudyLog] = [:]

    /// User's selected choice (0-based index) for each grammar MCQ.
    /// Keyed by `GrammarQuestion.id`. nil entry means unanswered.
    @Published private(set) var grammarAnswers: [String: Int] = [:]

    private let fileURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("words.json")
    }()

    private let studyLogsURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("study_logs.json")
    }()

    private let grammarAnswersURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("grammar_answers.json")
    }()

    // MARK: - Conversational-frequency review list

    /// Rows of the frequency-ranked review list (日本語 / 英語 / 会話頻度).
    /// Loaded lazily the first time the list is opened so app launch isn't
    /// slowed by parsing several thousand rows.
    private(set) lazy var rankedWords: [RankedWord] = RankedSeed.words

    /// Ids of the words the user tapped as "don't know" (shown in yellow).
    @Published private(set) var rankedMarks: Set<Int> = []

    private let rankedMarksURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("ranked_marks.json")
    }()

    func toggleRankedMark(_ id: Int) {
        if rankedMarks.contains(id) {
            rankedMarks.remove(id)
        } else {
            rankedMarks.insert(id)
        }
        saveRankedMarks()
    }

    func clearRankedMarks() {
        rankedMarks = []
        saveRankedMarks()
    }

    private func loadRankedMarks() {
        guard FileManager.default.fileExists(atPath: rankedMarksURL.path) else { return }
        if let data = try? Data(contentsOf: rankedMarksURL),
           let ids = try? JSONDecoder().decode([Int].self, from: data) {
            rankedMarks = Set(ids)
        }
    }

    private func saveRankedMarks() {
        if let data = try? JSONEncoder().encode(Array(rankedMarks).sorted()) {
            try? data.write(to: rankedMarksURL, options: .atomic)
        }
    }

    /// The app card registered for a row in the frequency list, matched by
    /// lowercased headword. Nil when the row has no card of its own.
    func registeredWord(for ranked: RankedWord) -> Word? {
        let key = ranked.english.trimmingCharacters(in: .whitespaces).lowercased()
        return words.first { $0.word.trimmingCharacters(in: .whitespaces).lowercased() == key }
    }

    init() {
        load()
        loadStudyLogs()
        loadGrammarAnswers()
        loadRankedMarks()
        // Drop any words that were retired from the seed list (e.g. the
        // Singlish set the user asked to remove). Runs every launch so
        // newly-retired words are scrubbed without manual user action.
        purgeRetiredWords()
        // Merge in any seed words that don't already exist (matched by lowercased word).
        // This way, app updates that add new vocabulary are reflected for existing users
        // without overwriting their review progress on previously-saved words.
        let existingWords = Set(words.map { $0.word.lowercased() })
        let newSeeds = WordStore.seedWords().filter {
            !existingWords.contains($0.word.lowercased())
        }
        if !newSeeds.isEmpty {
            words.append(contentsOf: newSeeds)
            save()
        }
        // Backfill IPA on previously-saved words that pre-date the
        // pronunciation feature. Looks each word up in the current seed
        // by lowercased text and copies its IPA across, preserving all
        // other user data (review counts, dates, etc.).
        backfillIPAFromSeed()
        // Drop any review-list pins that have aged past their 7-day window.
        cleanupExpiredReviewListEntries()
        // Auto-select 500 random words into the weekly review set (once a
        // week), excluding whatever was picked the previous week.
        refreshWeeklyReviewIfNeeded()
        // Pin "today" as Day 1 of the example study plan on first launch so
        // the Day counter can advance from a fixed anchor.
        ExamplePlan.ensureAnchor()
    }

    // MARK: - Weekly auto review set (500 random words, rotates weekly)

    /// Number of words auto-added to the review list each week.
    private let weeklyReviewCount = 500

    /// startOfDay timestamp of the last weekly auto-refresh, persisted in
    /// UserDefaults (WordStore is not a View, so @AppStorage is unavailable).
    private var weeklyReviewRefreshDay: Double {
        get { UserDefaults.standard.double(forKey: "reviewList.weeklyRefreshDay") }
        set { UserDefaults.standard.set(newValue, forKey: "reviewList.weeklyRefreshDay") }
    }

    /// Runs the weekly pick if it has never run, or if at least 7 days have
    /// passed since the last pick.
    private func refreshWeeklyReviewIfNeeded() {
        let todayStart = Calendar.current.startOfDay(for: Date()).timeIntervalSince1970
        let last = weeklyReviewRefreshDay
        if last == 0 || todayStart - last >= 7 * 24 * 60 * 60 {
            performWeeklyReviewRefresh()
            weeklyReviewRefreshDay = todayStart
        }
    }

    /// Clears last week's auto picks and selects a fresh set of up to 500
    /// random words. Words picked the previous week are excluded so the same
    /// word is never chosen two weeks in a row. Manual pins are untouched.
    private func performWeeklyReviewRefresh() {
        // The currently-flagged words are last week's picks.
        let previousIDs = Set(words.filter { $0.weeklyReviewAt != nil }.map { $0.id })
        // Clear all existing weekly flags.
        for i in words.indices where words[i].weeklyReviewAt != nil {
            words[i].weeklyReviewAt = nil
        }
        // Candidate pool excludes last week's picks. If there aren't enough
        // words left after the exclusion, fall back to the full list so we
        // can still fill the set.
        let candidates = words.filter { !previousIDs.contains($0.id) }
        let pool = candidates.count >= weeklyReviewCount ? candidates : words
        let pickedIDs = Set(pool.shuffled().prefix(weeklyReviewCount).map { $0.id })
        let now = Date()
        for i in words.indices where pickedIDs.contains(words[i].id) {
            words[i].weeklyReviewAt = now
        }
        save()
    }

    private func backfillIPAFromSeed() {
        let seedPairs: [(String, String)] = WordStore.seedWords().compactMap { w in
            guard let ipa = w.ipa, !ipa.isEmpty else { return nil }
            return (w.word.lowercased(), ipa)
        }
        let seedIPA = Dictionary(seedPairs, uniquingKeysWith: { first, _ in first })
        var changed = false
        for i in words.indices {
            if (words[i].ipa == nil || words[i].ipa?.isEmpty == true),
               let ipa = seedIPA[words[i].word.lowercased()] {
                words[i].ipa = ipa
                changed = true
            }
        }
        if changed { save() }
    }

    /// Remove any words whose lowercased text matches an entry in
    /// `SeedData.retiredWords`. Saves once if anything changed.
    private func purgeRetiredWords() {
        let retired = Set(SeedData.retiredWords.map { $0.lowercased() })
        let before = words.count
        words.removeAll { retired.contains($0.word.lowercased()) }
        if words.count != before {
            save()
        }
    }

    // MARK: - Review list (manually pinned words, auto-expire after 7 days)

    func toggleReviewList(for word: Word) {
        guard let idx = words.firstIndex(where: { $0.id == word.id }) else { return }
        if words[idx].isInReviewList {
            words[idx].addedToReviewListAt = nil
        } else {
            words[idx].addedToReviewListAt = Date()
        }
        save()
    }

    func cleanupExpiredReviewListEntries() {
        var changed = false
        for i in words.indices {
            if let added = words[i].addedToReviewListAt,
               Date().timeIntervalSince(added) >= 7 * 24 * 60 * 60 {
                words[i].addedToReviewListAt = nil
                changed = true
            }
        }
        if changed { save() }
    }

    /// Words shown in the focused review list: manual pins plus this week's
    /// auto-selected set. The order is re-shuffled once per day (stable
    /// within a day, rotates at midnight).
    var reviewListWords: [Word] {
        words.filter { $0.isInAnyReviewList }
            .dailyShuffled()
    }

    // MARK: - Persistence

    func load() {
        guard FileManager.default.fileExists(atPath: fileURL.path) else { return }
        do {
            let data = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            words = try decoder.decode([Word].self, from: data)
        } catch {
            print("Failed to load words: \(error)")
        }
    }

    func save() {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            let data = try encoder.encode(words)
            try data.write(to: fileURL, options: .atomic)
        } catch {
            print("Failed to save words: \(error)")
        }
    }

    // MARK: - Study logs (AI grammar explanations + composition attempts)

    private func loadStudyLogs() {
        guard FileManager.default.fileExists(atPath: studyLogsURL.path) else { return }
        do {
            let data = try Data(contentsOf: studyLogsURL)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            studyLogs = try decoder.decode([String: ExampleStudyLog].self, from: data)
        } catch {
            print("Failed to load study logs: \(error)")
        }
    }

    private func saveStudyLogs() {
        do {
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            let data = try encoder.encode(studyLogs)
            try data.write(to: studyLogsURL, options: .atomic)
        } catch {
            print("Failed to save study logs: \(error)")
        }
    }

    func studyLog(forKey key: String) -> ExampleStudyLog {
        studyLogs[key] ?? ExampleStudyLog()
    }

    func setAIGrammar(_ text: String, forKey key: String) {
        var log = studyLogs[key] ?? ExampleStudyLog()
        log.aiGrammar = text
        studyLogs[key] = log
        saveStudyLogs()
    }

    func appendCompositionAttempt(userText: String, feedback: String, forKey key: String) {
        var log = studyLogs[key] ?? ExampleStudyLog()
        log.attempts.insert(
            CompositionAttempt(date: Date(), userText: userText, feedback: feedback),
            at: 0
        )
        studyLogs[key] = log
        saveStudyLogs()
    }

    func deleteCompositionAttempt(id: UUID, forKey key: String) {
        guard var log = studyLogs[key] else { return }
        log.attempts.removeAll { $0.id == id }
        studyLogs[key] = log
        saveStudyLogs()
    }

    // MARK: - Grammar MCQ answers

    private func loadGrammarAnswers() {
        guard FileManager.default.fileExists(atPath: grammarAnswersURL.path) else { return }
        do {
            let data = try Data(contentsOf: grammarAnswersURL)
            grammarAnswers = try JSONDecoder().decode([String: Int].self, from: data)
        } catch {
            print("Failed to load grammar answers: \(error)")
        }
    }

    private func saveGrammarAnswers() {
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            let data = try encoder.encode(grammarAnswers)
            try data.write(to: grammarAnswersURL, options: .atomic)
        } catch {
            print("Failed to save grammar answers: \(error)")
        }
    }

    func recordGrammarAnswer(questionId: String, selectedIndex: Int) {
        grammarAnswers[questionId] = selectedIndex
        saveGrammarAnswers()
    }

    func resetGrammarAnswer(questionId: String) {
        grammarAnswers.removeValue(forKey: questionId)
        saveGrammarAnswers()
    }

    func resetAllGrammarAnswers() {
        grammarAnswers.removeAll()
        saveGrammarAnswers()
    }

    // MARK: - CRUD

    func add(_ word: Word) {
        words.append(word)
        save()
    }

    func update(_ word: Word) {
        guard let idx = words.firstIndex(where: { $0.id == word.id }) else { return }
        words[idx] = word
        save()
    }

    func updateExamples(for wordId: UUID, with examples: [ExampleSentence]) {
        guard let idx = words.firstIndex(where: { $0.id == wordId }) else { return }
        words[idx].examples = examples
        save()
    }

    func delete(at offsets: IndexSet) {
        words.remove(atOffsets: offsets)
        save()
    }

    func delete(id: UUID) {
        words.removeAll { $0.id == id }
        save()
    }

    /// Reset all words back to "未習得" with reviewCount=0 and due today.
    func resetAllProgress() {
        let now = Date()
        for i in words.indices {
            words[i].reviewCount = 0
            words[i].status = .unlearned
            words[i].nextReviewDate = now
            words[i].lastReviewedDate = nil
        }
        save()
    }

    // MARK: - Stats

    var totalCount: Int { words.count }
    var perfectCount: Int { words.filter { $0.status == .perfect }.count }
    var fuzzyCount: Int { words.filter { $0.status == .fuzzy }.count }
    var unlearnedCount: Int { words.filter { $0.status == .unlearned }.count }

    var progressFraction: Double {
        guard totalCount > 0 else { return 0 }
        return Double(perfectCount) / Double(totalCount)
    }

    /// Words due for review today (or earlier).
    var dueWords: [Word] {
        let now = Date()
        return words
            .filter { $0.nextReviewDate <= now }
            .sorted { $0.nextReviewDate < $1.nextReviewDate }
    }

    // MARK: - Home dashboard stats

    /// Words that need review today (nextReviewDate ≤ end of today).
    var dueTodayCount: Int {
        let cal = Calendar.current
        guard let endOfToday = cal.date(byAdding: .day, value: 1, to: cal.startOfDay(for: Date())) else {
            return dueWords.count
        }
        return words.filter { $0.nextReviewDate < endOfToday }.count
    }

    /// Words reviewed at least once today.
    var reviewedTodayCount: Int {
        let cal = Calendar.current
        let today = cal.startOfDay(for: Date())
        return words.filter {
            guard let d = $0.lastReviewedDate else { return false }
            return cal.isDate(d, inSameDayAs: today)
        }.count
    }

    /// Words that will be due within the next 7 days (including those
    /// already overdue).
    var dueThisWeekCount: Int {
        let cal = Calendar.current
        guard let endOfWeek = cal.date(
            byAdding: .day,
            value: 7,
            to: cal.startOfDay(for: Date())
        ) else {
            return dueWords.count
        }
        return words.filter { $0.nextReviewDate < endOfWeek }.count
    }

    /// Words reviewed at least once in the past 7 days (rolling window).
    var reviewedThisWeekCount: Int {
        let weekAgo = Date().addingTimeInterval(-7 * 24 * 60 * 60)
        return words.filter {
            guard let d = $0.lastReviewedDate else { return false }
            return d >= weekAgo
        }.count
    }

    // MARK: - Review logic

    /// Records a review and schedules the next review date.
    /// - ◎ 完璧: increment reviewCount, schedule by Ebbinghaus curve
    /// - △ あいまい: keep reviewCount, schedule 1 week later
    /// - × わからない: reset reviewCount=0, schedule next day
    /// Records a per-quiz-mode answer. Each (word, mode) pair has its own
    /// count and Ebbinghaus next-review date, so a word can be 復習完了 in
    /// 使う場面 mode while still being practiced in 例文翻訳 mode.
    func recordModeAnswer(_ mark: ReviewMark, for word: Word, modeKey: String) {
        guard let idx = words.firstIndex(where: { $0.id == word.id }) else { return }
        var w = words[idx]
        let now = Date()
        w.lastReviewedDate = now

        let currentCount = w.modeCounts[modeKey] ?? 0
        let newCount: Int
        let daysUntilNext: Int
        switch mark {
        case .perfect:
            newCount = currentCount + 1
            daysUntilNext = intervalDays(forCompletedReviewCount: newCount)
        case .fuzzy:
            newCount = currentCount
            daysUntilNext = 7
        case .forgot:
            newCount = 0
            daysUntilNext = 1
        }

        w.modeCounts[modeKey] = newCount
        w.modeNextReviewDates[modeKey] = Calendar.current.date(
            byAdding: .day, value: daysUntilNext, to: now
        ) ?? now

        // Keep the legacy reviewCount in sync (use the highest mode count) so
        // existing card-view UIs and the 一覧 sort continue to behave.
        w.reviewCount = max(w.reviewCount, w.modeCounts.values.max() ?? 0)
        if mark == .perfect { w.status = .perfect }
        if mark == .fuzzy { w.status = .fuzzy }
        if mark == .forgot { w.status = .unlearned }

        words[idx] = w
        save()
    }

    func record(mark: ReviewMark, for word: Word) {
        guard let idx = words.firstIndex(where: { $0.id == word.id }) else { return }
        var w = words[idx]
        let now = Date()
        w.lastReviewedDate = now

        let daysUntilNext: Int
        switch mark {
        case .perfect:
            w.reviewCount += 1
            w.status = .perfect
            daysUntilNext = intervalDays(forCompletedReviewCount: w.reviewCount)
        case .fuzzy:
            w.status = .fuzzy
            daysUntilNext = 7
        case .forgot:
            w.reviewCount = 0
            w.status = .unlearned
            daysUntilNext = 1
        }

        w.nextReviewDate = Calendar.current.date(
            byAdding: .day,
            value: daysUntilNext,
            to: now
        ) ?? now

        words[idx] = w
        save()
    }

    // MARK: - Seed

    static func seedWords() -> [Word] {
        return originalSeedWords() + SeedData.additionalWords
    }

    private static func originalSeedWords() -> [Word] {
        return [
            Word(
                word: "thread",
                definitionEnglish: "a thin strand used for sewing; a series of connected messages or ideas",
                definitionJapanese: "糸／（SNSなどの）スレ・一連の話題",
                useCases: ["裁縫の糸", "Xや掲示板の投稿の流れ", "話の流れ"],
                examples: [
                    ExampleSentence(english: "Use this thread to sew.", japanese: "この糸で縫って。"),
                    ExampleSentence(english: "I followed the thread online.", japanese: "そのスレを追った。"),
                    ExampleSentence(english: "The thread of the story is clear.", japanese: "話の流れが明確だ。")
                ],
                synonyms: [
                    SynonymGroup(
                        word: "string",
                        meaning: "ひも",
                        definitionEnglish: "a thin, twisted material used for tying or binding things",
                        useCases: ["物を縛る・結ぶとき", "工作・梱包の場面"],
                        examples: [
                            ExampleSentence(english: "Tie it with a string.", japanese: "ひもで結ぶ。"),
                            ExampleSentence(english: "A piece of string.", japanese: "一本のひも。")
                        ]
                    )
                ]
            ),
            Word(
                word: "spokesman",
                definitionEnglish: "a person who speaks officially for an organization or group",
                definitionJapanese: "広報担当・公式発言者",
                useCases: ["会社・政府の代表コメント", "公式見解を伝える人"],
                examples: [
                    ExampleSentence(english: "The spokesman gave a statement.", japanese: "広報が声明を出した。"),
                    ExampleSentence(english: "He is the company spokesman.", japanese: "彼は会社の広報だ。"),
                    ExampleSentence(english: "The spokesman answered questions.", japanese: "広報が質問に答えた。")
                ],
                synonyms: [
                    SynonymGroup(
                        word: "representative",
                        meaning: "代表",
                        definitionEnglish: "a person chosen to act or speak for a group",
                        useCases: ["会社・団体の代表として動く人"],
                        examples: [
                            ExampleSentence(english: "Company representative.", japanese: "会社の代表。"),
                            ExampleSentence(english: "Official representative.", japanese: "公式代表。")
                        ]
                    )
                ]
            ),
            Word(
                word: "speaker",
                definitionEnglish: "a person who is speaking; a device that produces sound",
                definitionJapanese: "話し手／スピーカー（音響機器）",
                useCases: [
                    "プレゼン・講演で話している人を指すとき",
                    "音楽用の音響機器について話すとき"
                ],
                examples: [
                    ExampleSentence(english: "He is a great speaker.", japanese: "彼は話が上手だ。"),
                    ExampleSentence(english: "Turn up the speaker volume.", japanese: "スピーカーの音量を上げて。"),
                    ExampleSentence(english: "The keynote speaker arrived.", japanese: "基調講演者が到着した。")
                ],
                synonyms: []
            ),
            Word(
                word: "box",
                definitionEnglish: "a container with flat sides; to put into a box; to fight as a sport",
                definitionJapanese: "箱／箱に入れる／ボクシングする",
                useCases: [
                    "物を入れる容器について話すとき",
                    "梱包する動作を表すとき",
                    "スポーツのボクシングをするとき"
                ],
                examples: [
                    ExampleSentence(english: "Put it in the box.", japanese: "それを箱に入れて。"),
                    ExampleSentence(english: "I'll box these up.", japanese: "これを箱詰めしておくね。"),
                    ExampleSentence(english: "He boxes on weekends.", japanese: "彼は週末にボクシングをする。")
                ],
                synonyms: []
            ),
            Word(
                word: "a bunch of",
                definitionEnglish: "a large number or amount of something (informal)",
                definitionJapanese: "たくさんの（カジュアル）",
                useCases: [
                    "カジュアルに「たくさん」と言いたいとき",
                    "友達や同僚との日常会話"
                ],
                examples: [
                    ExampleSentence(english: "I have a bunch of work to do.", japanese: "やることがたくさんある。"),
                    ExampleSentence(english: "We bought a bunch of snacks.", japanese: "お菓子をいっぱい買った。"),
                    ExampleSentence(english: "There were a bunch of people.", japanese: "人がたくさんいた。")
                ],
                synonyms: [
                    SynonymGroup(
                        word: "lots of",
                        meaning: "たくさんの",
                        definitionEnglish: "a large amount of something",
                        useCases: ["カジュアルに量の多さを表す"],
                        examples: [
                            ExampleSentence(english: "Lots of fun.", japanese: "とても楽しい。"),
                            ExampleSentence(english: "Lots of people came.", japanese: "たくさんの人が来た。")
                        ]
                    )
                ]
            ),
            Word(
                word: "playful",
                definitionEnglish: "full of fun and energy; light-hearted and joking",
                definitionJapanese: "遊び心のある・ふざけた（ポジティブ）",
                useCases: [
                    "人や雰囲気が陽気でユーモラスな様子",
                    "デザインや言い回しに「遊び心」があるとき"
                ],
                examples: [
                    ExampleSentence(english: "She has a playful personality.", japanese: "彼女は遊び心のある性格だ。"),
                    ExampleSentence(english: "His tone was playful.", japanese: "彼の口調はおどけていた。"),
                    ExampleSentence(english: "A playful design.", japanese: "遊び心のあるデザイン。")
                ],
                synonyms: []
            )
        ]
    }
}
