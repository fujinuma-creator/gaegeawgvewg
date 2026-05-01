import Foundation
import SwiftUI

@MainActor
final class WordStore: ObservableObject {
    @Published private(set) var words: [Word] = []

    private let fileURL: URL = {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docs.appendingPathComponent("words.json")
    }()

    init() {
        load()
        if words.isEmpty {
            words = WordStore.seedWords()
            save()
        }
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

    func delete(at offsets: IndexSet) {
        words.remove(atOffsets: offsets)
        save()
    }

    func delete(id: UUID) {
        words.removeAll { $0.id == id }
        save()
    }

    // MARK: - Review logic

    var dueWords: [Word] {
        let now = Date()
        return words.filter { $0.nextReviewDate <= now }
                    .sorted { $0.nextReviewDate < $1.nextReviewDate }
    }

    /// Records a review and schedules the next review date.
    /// - ◎ (good): jump to 3 months later (and stay at 3-month stage)
    /// - △ (fuzzy): jump to 1 week later
    /// - × (forgot): reset to next day
    func record(mark: ReviewMark, for word: Word) {
        guard let idx = words.firstIndex(where: { $0.id == word.id }) else { return }
        var w = words[idx]
        let now = Date()
        w.lastReviewedDate = now

        switch mark {
        case .good:
            w.stage = .threeMonths
        case .fuzzy:
            w.stage = .oneWeek
        case .forgot:
            w.stage = .nextDay
        }

        w.nextReviewDate = Calendar.current.date(
            byAdding: .day,
            value: w.stage.days,
            to: now
        ) ?? now

        words[idx] = w
        save()
    }

    // MARK: - Seed

    static func seedWords() -> [Word] {
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
                        examples: [
                            ExampleSentence(english: "Tie it with a string.", japanese: "ひもで結ぶ。"),
                            ExampleSentence(english: "A piece of string", japanese: "一本のひも")
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
                        examples: [
                            ExampleSentence(english: "Company representative", japanese: "会社の代表"),
                            ExampleSentence(english: "Official representative", japanese: "公式代表")
                        ]
                    )
                ]
            )
        ]
    }
}
