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

    enum CodingKeys: String, CodingKey {
        case id, word, definitionEnglish, definitionJapanese, useCases,
             examples, synonyms,
             reviewCount, status, nextReviewDate, lastReviewedDate, createdAt
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
        createdAt: Date = Date()
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
