import Foundation

struct Word: Identifiable, Codable, Hashable {
    let id: String
    let word: String
    let pinyin: String
    let japanese: String
    let definition: String
    let useCase: String
    let examples: [String]
    let synonyms: [String]
}

struct ReviewData: Codable, Hashable {
    var wordId: String
    var lastReviewDate: TimeInterval
    var nextReviewDate: TimeInterval
    var reviewCount: Int
    var isReviewed: Bool
}

enum ReviewResult {
    case good
    case soso
    case bad

    var daysUntilNext: Int {
        switch self {
        case .good: return 60
        case .soso: return 7
        case .bad: return 1
        }
    }

    var label: String {
        switch self {
        case .good: return "〇 覚えた (60日後)"
        case .soso: return "△ 忘れそう (7日後)"
        case .bad: return "× 覚えてない (1日後)"
        }
    }
}

struct Stats {
    var total: Int = 0
    var reviewed: Int = 0
    var todayReview: Int = 0
}
