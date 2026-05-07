import Foundation

struct ExampleSentence: Codable, Identifiable, Hashable {
    var id = UUID()
    var english: String
    var japanese: String
    /// Pre-generated Japanese explanation of the grammar / usage of this
    /// example sentence (e.g. why "I've decided" rather than "I decided").
    /// Optional for backward compatibility with examples saved before this
    /// field existed and for the seed data that ships without explanations.
    var grammar: String? = nil

    enum CodingKeys: String, CodingKey {
        case english, japanese, grammar
    }
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

    /// Per-quiz-mode "正解した回数". Keys are QuizMode.modeKey strings:
    /// "useCase", "definition", "translation". A word is considered
    /// 復習完了 in a mode once its count reaches 4. Independent of the
    /// overall reviewCount used by the card view.
    var modeCounts: [String: Int] = [:]

    /// Per-quiz-mode next review date (Ebbinghaus). Mirrors modeCounts:
    /// each (word, mode) pair gets its own due date.
    var modeNextReviewDates: [String: Date] = [:]

    enum CodingKeys: String, CodingKey {
        case id, word, definitionEnglish, definitionJapanese, useCases,
             examples, synonyms,
             reviewCount, status, nextReviewDate, lastReviewedDate, createdAt,
             addedToReviewListAt,
             modeCounts, modeNextReviewDates
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
        addedToReviewListAt: Date? = nil,
        modeCounts: [String: Int] = [:],
        modeNextReviewDates: [String: Date] = [:]
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
        self.modeCounts = modeCounts
        self.modeNextReviewDates = modeNextReviewDates
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
        self.modeCounts = try c.decodeIfPresent([String: Int].self, forKey: .modeCounts) ?? [:]
        self.modeNextReviewDates = try c.decodeIfPresent([String: Date].self, forKey: .modeNextReviewDates) ?? [:]
    }

    /// True when every quiz mode has been answered correctly at least 4 times
    /// (= 復習完了 across the board). Used to push the word to the bottom of
    /// the 一覧 list and remove it from quiz pools.
    var isFullyCompleted: Bool {
        ["useCase", "definition", "translation"].allSatisfy {
            (modeCounts[$0] ?? 0) >= 4
        }
    }

    /// True if the word is currently pinned to the focused review list
    /// (added within the last 7 days).
    var isInReviewList: Bool {
        guard let added = addedToReviewListAt else { return false }
        return Date().timeIntervalSince(added) < 7 * 24 * 60 * 60
    }
}

/// One user attempt at translating an example sentence, paired with the
/// AI feedback returned for it. Stored per-example so the user can scroll
/// back through their progress.
struct CompositionAttempt: Codable, Identifiable, Hashable {
    var id: UUID = UUID()
    var date: Date = Date()
    var userText: String
    var feedback: String
}

/// All AI-assisted study artifacts attached to a single example sentence:
/// the on-demand grammar explanation Gemini wrote, plus the user's past
/// composition attempts with their AI corrections.
struct ExampleStudyLog: Codable, Hashable {
    var aiGrammar: String? = nil
    var attempts: [CompositionAttempt] = []
}

// MARK: - Grammar lesson models

/// One Japanese-to-English translation problem aligned with a grammar
/// topic. `modelEnglish` is the reference answer used when grading the
/// user's own attempt.
struct GrammarTranslationProblem: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var japanese: String
    var modelEnglish: String
    var hint: String? = nil
}

/// One option inside a `GrammarMultipleChoiceProblem`.
struct GrammarMCQOption: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var text: String
}

/// One multiple-choice grammar question. `correctOptionId` matches one of
/// the option ids in `options`. `explanation` is a Japanese write-up of
/// why the answer is correct (and the others wrong).
struct GrammarMultipleChoiceProblem: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var question: String
    var options: [GrammarMCQOption]
    var correctOptionId: UUID
    var explanation: String
}

/// Per-topic mutable state persisted to disk: the latest generated
/// translation/MCQ problems plus the user's composition history for
/// translation tasks on this topic.
struct GrammarTopicState: Codable, Hashable {
    var translation: GrammarTranslationProblem? = nil
    var translationAttempts: [CompositionAttempt] = []
    var mcq: GrammarMultipleChoiceProblem? = nil
    var mcqLastSelectedOptionId: UUID? = nil
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
