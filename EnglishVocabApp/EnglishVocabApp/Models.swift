import Foundation

struct ExampleSentence: Codable, Identifiable, Hashable {
    var id = UUID()
    var english: String
    var japanese: String

    enum CodingKeys: String, CodingKey { case english, japanese }
}

struct SynonymGroup: Codable, Identifiable, Hashable {
    var id = UUID()
    var word: String
    var meaning: String
    var definitionEnglish: String
    var useCases: [String]
    var examples: [ExampleSentence]

    enum CodingKeys: String, CodingKey {
        case word, meaning, definitionEnglish, useCases, examples
    }
}

enum WordStatus: String, Codable, CaseIterable {
    case unlearned   // 未習得
    case fuzzy       // あいまい
    case perfect     // 完璧

    var label: String {
        switch self {
        case .unlearned: return "未習得"
        case .fuzzy:     return "あいまい"
        case .perfect:   return "完璧"
        }
    }

    var symbol: String {
        switch self {
        case .unlearned: return ""
        case .fuzzy:     return "△"
        case .perfect:   return "◎"
        }
    }
}

enum ReviewMark: String, Codable {
    case perfect      // ◎ 完璧
    case fuzzy        // △ あいまい
    case forgot       // × わからない

    var symbol: String {
        switch self {
        case .perfect: return "◎"
        case .fuzzy:   return "△"
        case .forgot:  return "×"
        }
    }

    var label: String {
        switch self {
        case .perfect: return "完璧"
        case .fuzzy:   return "あいまい"
        case .forgot:  return "わからない"
        }
    }
}

struct Word: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var word: String
    var definitionEnglish: String
    var definitionJapanese: String
    var useCases: [String]
    var examples: [ExampleSentence]
    var synonyms: [SynonymGroup]

    // Review state
    var reviewCount: Int = 0
    var status: WordStatus = .unlearned
    var nextReviewDate: Date = Date()
    var lastReviewedDate: Date? = nil
    var createdAt: Date = Date()

    /// When the user manually pinned this word to the focused review list.
    /// Entries automatically expire 7 days after they are added.
    var addedToReviewListAt: Date? = nil

    enum CodingKeys: String, CodingKey {
        case id, word, definitionEnglish, definitionJapanese, useCases,
             examples, synonyms,
             reviewCount, status, nextReviewDate, lastReviewedDate, createdAt,
             addedToReviewListAt
    }

    init(
        id: UUID = UUID(),
        word: String,
        definitionEnglish: String,
        definitionJapanese: String,
        useCases: [String],
        examples: [ExampleSentence],
        synonyms: [SynonymGroup] = [],
        reviewCount: Int = 0,
        status: WordStatus = .unlearned,
        nextReviewDate: Date = Date(),
        lastReviewedDate: Date? = nil,
        createdAt: Date = Date(),
        addedToReviewListAt: Date? = nil
    ) {
        self.id = id
        self.word = word
        self.definitionEnglish = definitionEnglish
        self.definitionJapanese = definitionJapanese
        self.useCases = useCases
        self.examples = examples
        self.synonyms = synonyms
        self.reviewCount = reviewCount
        self.status = status
        self.nextReviewDate = nextReviewDate
        self.lastReviewedDate = lastReviewedDate
        self.createdAt = createdAt
        self.addedToReviewListAt = addedToReviewListAt
    }

    /// Decoder that fills in defaults for fields added in later schema versions
    /// so previously-saved data still loads cleanly.
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try c.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        self.word = try c.decode(String.self, forKey: .word)
        self.definitionEnglish = try c.decodeIfPresent(String.self, forKey: .definitionEnglish) ?? ""
        self.definitionJapanese = try c.decodeIfPresent(String.self, forKey: .definitionJapanese) ?? ""
        self.useCases = try c.decodeIfPresent([String].self, forKey: .useCases) ?? []
        self.examples = try c.decodeIfPresent([ExampleSentence].self, forKey: .examples) ?? []
        self.synonyms = try c.decodeIfPresent([SynonymGroup].self, forKey: .synonyms) ?? []
        self.reviewCount = try c.decodeIfPresent(Int.self, forKey: .reviewCount) ?? 0
        self.status = try c.decodeIfPresent(WordStatus.self, forKey: .status) ?? .unlearned
        self.nextReviewDate = try c.decodeIfPresent(Date.self, forKey: .nextReviewDate) ?? Date()
        self.lastReviewedDate = try c.decodeIfPresent(Date.self, forKey: .lastReviewedDate)
        self.createdAt = try c.decodeIfPresent(Date.self, forKey: .createdAt) ?? Date()
        self.addedToReviewListAt = try c.decodeIfPresent(Date.self, forKey: .addedToReviewListAt)
    }

    /// True if the word is currently pinned to the focused review list
    /// (added within the last 7 days).
    var isInReviewList: Bool {
        guard let added = addedToReviewListAt else { return false }
        return Date().timeIntervalSince(added) < 7 * 24 * 60 * 60
    }
}

/// Returns the number of days until the next review based on completed review count.
/// User-specified Ebbinghaus curve:
/// - 1st review done → 1 day later
/// - 2nd review done → 3 days later
/// - 3rd review done → 14 days later (2 weeks)
/// - 4th review done → 30 days later (1 month)
/// - 5+ reviews done → 60 days later (2 months)
func intervalDays(forCompletedReviewCount count: Int) -> Int {
    switch max(count, 0) {
    case 0, 1: return 1
    case 2:    return 3
    case 3:    return 14
    case 4:    return 30
    default:   return 60
    }
}
