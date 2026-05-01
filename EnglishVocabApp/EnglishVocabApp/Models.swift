import Foundation

struct ExampleSentence: Codable, Identifiable, Hashable {
    var id = UUID()
    var english: String
    var japanese: String

    enum CodingKeys: String, CodingKey {
        case english, japanese
    }
}

struct SynonymGroup: Codable, Identifiable, Hashable {
    var id = UUID()
    var word: String
    var meaning: String
    var examples: [ExampleSentence]

    enum CodingKeys: String, CodingKey {
        case word, meaning, examples
    }
}

enum EbbinghausStage: Int, Codable, CaseIterable {
    case nextDay = 0
    case threeDays
    case oneWeek
    case oneMonth
    case twoMonths
    case threeMonths

    var days: Int {
        switch self {
        case .nextDay: return 1
        case .threeDays: return 3
        case .oneWeek: return 7
        case .oneMonth: return 30
        case .twoMonths: return 60
        case .threeMonths: return 90
        }
    }

    func next() -> EbbinghausStage {
        let nextRaw = rawValue + 1
        return EbbinghausStage(rawValue: nextRaw) ?? .threeMonths
    }

    var label: String {
        switch self {
        case .nextDay: return "翌日"
        case .threeDays: return "3日後"
        case .oneWeek: return "1週間後"
        case .oneMonth: return "1か月後"
        case .twoMonths: return "2か月後"
        case .threeMonths: return "3か月後"
        }
    }
}

enum ReviewMark: String, Codable {
    case good      // ◎ memorized
    case fuzzy     // △ might forget
    case forgot    // × don't remember

    var symbol: String {
        switch self {
        case .good: return "◎"
        case .fuzzy: return "△"
        case .forgot: return "×"
        }
    }

    var label: String {
        switch self {
        case .good: return "覚えた"
        case .fuzzy: return "忘れそう"
        case .forgot: return "覚えてない"
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

    // Review schedule state
    var stage: EbbinghausStage = .nextDay
    var nextReviewDate: Date = Date()
    var lastReviewedDate: Date? = nil
    var createdAt: Date = Date()

    enum CodingKeys: String, CodingKey {
        case id, word, definitionEnglish, definitionJapanese, useCases,
             examples, synonyms, stage, nextReviewDate, lastReviewedDate, createdAt
    }

    init(
        id: UUID = UUID(),
        word: String,
        definitionEnglish: String,
        definitionJapanese: String,
        useCases: [String],
        examples: [ExampleSentence],
        synonyms: [SynonymGroup],
        stage: EbbinghausStage = .nextDay,
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
        self.stage = stage
        self.nextReviewDate = nextReviewDate
        self.lastReviewedDate = lastReviewedDate
        self.createdAt = createdAt
    }
}
