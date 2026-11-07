import Foundation
import SwiftUI

// MARK: - Review stage (1日後 → 1週間後 → 2週間後 → 1ヶ月後)

enum ReviewStage: Int, Codable, CaseIterable {
    case day1 = 0, week1, week2, month1

    var label: String {
        switch self {
        case .day1:   return "1日後"
        case .week1:  return "1週間後"
        case .week2:  return "2週間後"
        case .month1: return "1ヶ月後"
        }
    }

    var intervalDays: Int {
        switch self {
        case .day1:   return 1
        case .week1:  return 7
        case .week2:  return 14
        case .month1: return 30
        }
    }

    var color: Color {
        switch self {
        case .day1:   return Palette.stageRed
        case .week1:  return Palette.stageYellow
        case .week2:  return Palette.stageBlue
        case .month1: return Palette.stageTeal
        }
    }

    var next: ReviewStage { ReviewStage(rawValue: min(rawValue + 1, 3))! }
}

// MARK: - Word

/// 例文・関連表現: 英語 / 発音記号 / 日本語.
struct Example: Codable, Identifiable, Hashable {
    var id = UUID()
    var english: String
    var ipa: String        // British-RP IPA, may be empty
    var japanese: String

    enum CodingKeys: String, CodingKey { case english, ipa, japanese }

    init(english: String, ipa: String, japanese: String) {
        self.english = english; self.ipa = ipa; self.japanese = japanese
    }
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        english = try c.decode(String.self, forKey: .english)
        ipa = try c.decodeIfPresent(String.self, forKey: .ipa) ?? ""
        japanese = try c.decodeIfPresent(String.self, forKey: .japanese) ?? ""
    }

    /// IPA wrapped in exactly one pair of slashes (empty stays empty).
    var ipaDisplay: String { Word.slashed(ipa) }
}

struct Word: Codable, Identifiable, Hashable {
    var id: String                 // stable seed id ("s:come up with") or "u-…" for user words
    var word: String               // 英語
    var ipa: String                // 発音記号（イギリス英語）
    var japanese: String           // 日本語の意味
    var definition: String         // 英語の定義（English explanation）
    var useCases: [String]
    var examples: [Example]
    var related: [Example]         // 関連表現 (english / ipa / japanese)

    // 学習状態
    var stage: Int = 0             // ReviewStage.rawValue
    var reviewCount: Int = 0
    var nextReviewDate: Date = Date().startOfDay
    var lastReviewedDate: Date? = nil
    var createdAt: Date = Date()
    var checked: Bool = false
    var learned: Bool = false      // 1ヶ月後の段階で思い出せた

    var reviewStage: ReviewStage { ReviewStage(rawValue: stage) ?? .day1 }

    /// 会話頻度 ★1〜5（頻度リストにある語のみ）。
    var frequency: Int? { RankedSeed.frequency(of: word) }

    var ipaDisplay: String { Self.slashed(ipa) }

    static func slashed(_ s: String) -> String {
        let bare = s.trimmingCharacters(in: CharacterSet(charactersIn: "/ "))
        return bare.isEmpty ? "" : "/\(bare)/"
    }

    enum CodingKeys: String, CodingKey {
        case id, word, ipa, japanese, definition, useCases, examples, related,
             stage, reviewCount, nextReviewDate, lastReviewedDate, createdAt, checked, learned
    }

    init(id: String, word: String, ipa: String, japanese: String, definition: String,
         useCases: [String], examples: [Example], related: [Example] = []) {
        self.id = id; self.word = word; self.ipa = ipa; self.japanese = japanese
        self.definition = definition; self.useCases = useCases; self.examples = examples; self.related = related
    }

    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        id = try c.decode(String.self, forKey: .id)
        word = try c.decode(String.self, forKey: .word)
        ipa = try c.decodeIfPresent(String.self, forKey: .ipa) ?? ""
        japanese = try c.decodeIfPresent(String.self, forKey: .japanese) ?? ""
        definition = try c.decodeIfPresent(String.self, forKey: .definition) ?? ""
        useCases = try c.decodeIfPresent([String].self, forKey: .useCases) ?? []
        examples = try c.decodeIfPresent([Example].self, forKey: .examples) ?? []
        related = try c.decodeIfPresent([Example].self, forKey: .related) ?? []
        stage = try c.decodeIfPresent(Int.self, forKey: .stage) ?? 0
        reviewCount = try c.decodeIfPresent(Int.self, forKey: .reviewCount) ?? 0
        nextReviewDate = try c.decodeIfPresent(Date.self, forKey: .nextReviewDate) ?? Date().startOfDay
        lastReviewedDate = try c.decodeIfPresent(Date.self, forKey: .lastReviewedDate)
        createdAt = try c.decodeIfPresent(Date.self, forKey: .createdAt) ?? Date()
        checked = try c.decodeIfPresent(Bool.self, forKey: .checked) ?? false
        learned = try c.decodeIfPresent(Bool.self, forKey: .learned) ?? false
    }
}

/// One entry in the conversational-frequency list (日本語 / 英語 / 会話頻度 ★1〜5).
/// `id` is the 1-based row number in `RankedSeed`.
struct RankedWord: Identifiable, Hashable {
    let id: Int
    let japanese: String
    let english: String
    let frequency: Int
    let gloss: String

    var stars: String {
        String(repeating: "★", count: max(0, min(frequency, 5)))
            + String(repeating: "☆", count: max(0, 5 - frequency))
    }
}

// MARK: - Study statistics

struct StudyStats: Codable {
    enum CodingKeys: String, CodingKey { case studiedDays, totalSeconds, dailySeconds, dailyReviews }
    init() {}
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        studiedDays = try c.decodeIfPresent(Set<TimeInterval>.self, forKey: .studiedDays) ?? []
        totalSeconds = try c.decodeIfPresent(TimeInterval.self, forKey: .totalSeconds) ?? 0
        dailySeconds = try c.decodeIfPresent([String: TimeInterval].self, forKey: .dailySeconds) ?? [:]
        dailyReviews = try c.decodeIfPresent([String: Int].self, forKey: .dailyReviews) ?? [:]
    }
    /// startOfDay timestamps of every day with study activity.
    var studiedDays: Set<TimeInterval> = []
    /// Accumulated foreground time in seconds (legacy, no longer shown).
    var totalSeconds: TimeInterval = 0
    /// Study time per day, in seconds, keyed by startOfDay timestamp.
    var dailySeconds: [String: TimeInterval] = [:]
    /// Number of flashcard answers per day (startOfDay key), for the calendar.
    var dailyReviews: [String: Int] = [:]

    mutating func addReview(on date: Date) { dailyReviews[Self.key(date), default: 0] += 1 }
    func reviews(on date: Date) -> Int { dailyReviews[Self.key(date)] ?? 0 }

    private static func key(_ date: Date) -> String { String(Int(date.startOfDay.timeIntervalSince1970)) }

    mutating func addSeconds(_ s: TimeInterval, on date: Date) {
        dailySeconds[Self.key(date), default: 0] += s
    }

    func seconds(on date: Date) -> TimeInterval { dailySeconds[Self.key(date)] ?? 0 }
    var todaySeconds: TimeInterval { seconds(on: Date()) }

    /// "48時間 20分" / "20分" style text.
    static func timeText(_ s: TimeInterval) -> String {
        let h = Int(s) / 3600, m = (Int(s) % 3600) / 60
        return h > 0 ? "\(h)時間 \(m)分" : "\(m)分"
    }

    mutating func markToday() {
        studiedDays.insert(Date().startOfDay.timeIntervalSince1970)
    }

    func studied(on date: Date) -> Bool {
        studiedDays.contains(date.startOfDay.timeIntervalSince1970)
    }

    /// Consecutive days ending today (or yesterday if today has no activity yet).
    var streak: Int {
        var day = Date().startOfDay
        if !studied(on: day) { day = day.adding(days: -1) }
        var n = 0
        while studied(on: day) { n += 1; day = day.adding(days: -1) }
        return n
    }

    var hours: Int { Int(todaySeconds) / 3600 }
    var minutes: Int { (Int(todaySeconds) % 3600) / 60 }
}

// MARK: - Topic conversations

enum TopicLevel: String, Codable, CaseIterable, Identifiable {
    case beginner = "入門", basic = "初級", intermediate = "中級", advanced = "上級"
    var id: String { rawValue }
}

struct TopicCategory: Identifiable, Hashable {
    let id: String      // name
    let color: Color
    var name: String { id }
}

struct DialogueLine: Identifiable, Hashable {
    let id: Int
    let speaker: String   // "A" / "B"
    let english: String
    let ipa: String       // empty for topic lines (発音記号は会話では表示しない)
    let japanese: String
    /// True when a dashed divider should be drawn above this line (the --- in
    /// the source: a jump in time or place inside the same conversation).
    var sectionBreak: Bool = false
}

struct KeyExpression: Identifiable, Hashable {
    let id: Int
    let english: String
    let japanese: String
}

struct TopicConversation: Identifiable, Hashable {
    let id: String
    let emoji: String
    let title: String
    let category: String
    let level: TopicLevel
    let lines: [DialogueLine]
    let keys: [KeyExpression]
}

// MARK: - Grammar

/// One coloured word block inside a grammar explanation (主語 / 動詞 / 目的語).
struct GrammarChunk: Identifiable, Hashable {
    let id = UUID()
    let text: String
    let label: String
    let tint: Int   // 0 blue, 1 red, 2 yellow, 3 green
}

struct GrammarExample: Identifiable, Hashable {
    let id = UUID()
    let english: String
    let ipa: String
    let japanese: String
}

/// A sub-section inside a grammar topic (e.g. 「don't = 一般動詞を打ち消す」).
struct GrammarSection: Identifiable, Hashable {
    let id = UUID()
    let heading: String
    let keyword: String
    let chunks: [GrammarChunk]
    let examples: [GrammarExample]
}

struct GrammarTopic: Identifiable, Hashable {
    let id: String
    let level: TopicLevel
    let title: String          // 否定 don't ／ isn't
    let summary: String
    let sample: String         // I don't know.
    let detailTitle: String
    let detailSubtitle: String
    let sections: [GrammarSection]
    let tipTitle: String       // 見分け方
    let tip: String
    let wrong: String          // × I not know.
    let right: String          // ○ I don't know.
}

/// One curated 4-choice grammar question (練習問題).
struct GrammarQuestion: Identifiable, Hashable, Codable {
    var id: String
    var question: String
    var choices: [String]
    var correctIndex: Int
    var translation: String
    var explanation: String
}

// MARK: - Pronunciation

enum SoundGroup: String, CaseIterable, Identifiable {
    case vowels = "母音", diphthongs = "二重母音", consonants = "子音"
    var id: String { rawValue }
}

/// 発音画面で見せる単語（英語・発音記号・意味）。AIで増やした分も同じ形で保存する。
struct SoundWord: Codable, Hashable, Identifiable {
    var id: String { word.lowercased() }
    let word: String
    let ipa: String
    let japanese: String

    var ipaDisplay: String { Word.slashed(ipa) }
}

struct SoundItem: Identifiable, Hashable {
    let id: String             // phoneme token as it appears in the IPA, e.g. "iː"
    let group: SoundGroup
    let symbol: String         // shown big: /iː/
    let name: String           // 長いイー
    let exampleWord: String    // sheep
    let exampleIPA: String     // /ʃiːp/
    let exampleJapanese: String
    let title: String          // 長いイー /iː/
    let subtitle: String
    let steps: [String]        // 口の形 / コツ / 注意点
    let moreExamples: [SoundWord]

    static func == (a: SoundItem, b: SoundItem) -> Bool { a.id == b.id && a.group == b.group }
    func hash(into h: inout Hasher) { h.combine(id); h.combine(group) }
}
