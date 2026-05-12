import Foundation
import SwiftUI

@MainActor
final class WordStore: ObservableObject {
    @Published private(set) var words: [Word] = []
    @Published private(set) var reviewData: [ReviewData] = []
    @Published private(set) var currentWord: Word?
    @Published private(set) var stats = Stats()
    @Published var showAnswer: Bool = false
    @Published private(set) var isLoading: Bool = true

    private let reviewDataKey = "reviewData"

    init() {
        load()
    }

    func load() {
        isLoading = true
        words = Self.loadWords()
        reviewData = Self.loadReviewData(key: reviewDataKey) ?? initializeReviewData()
        syncWithWords()
        loadTodayWord()
        updateStats()
        isLoading = false
    }

    private func initializeReviewData() -> [ReviewData] {
        words.map {
            ReviewData(
                wordId: $0.id,
                lastReviewDate: 0,
                nextReviewDate: 0,
                reviewCount: 0,
                isReviewed: false
            )
        }
    }

    private func syncWithWords() {
        let existingIds = Set(reviewData.map(\.wordId))
        for w in words where !existingIds.contains(w.id) {
            reviewData.append(
                ReviewData(
                    wordId: w.id,
                    lastReviewDate: 0,
                    nextReviewDate: 0,
                    reviewCount: 0,
                    isReviewed: false
                )
            )
        }
    }

    func loadTodayWord() {
        let now = Date().timeIntervalSince1970
        let due = reviewData.filter { $0.nextReviewDate <= now && !$0.isReviewed }
        guard let pick = due.randomElement(),
              let word = words.first(where: { $0.id == pick.wordId }) else {
            currentWord = nil
            showAnswer = false
            return
        }
        currentWord = word
        showAnswer = false
    }

    func updateStats() {
        let now = Date().timeIntervalSince1970
        stats = Stats(
            total: words.count,
            reviewed: reviewData.filter { $0.reviewCount > 0 }.count,
            todayReview: reviewData.filter { $0.nextReviewDate <= now && !$0.isReviewed }.count
        )
    }

    func review(_ result: ReviewResult) {
        guard let current = currentWord,
              let idx = reviewData.firstIndex(where: { $0.wordId == current.id }) else { return }

        let now = Date().timeIntervalSince1970
        let nextInterval = TimeInterval(result.daysUntilNext) * 24 * 60 * 60

        reviewData[idx].lastReviewDate = now
        reviewData[idx].nextReviewDate = now + nextInterval
        reviewData[idx].reviewCount += 1
        reviewData[idx].isReviewed = true

        persist()
        updateStats()
        loadTodayWord()
    }

    func resetTodayProgress() {
        for i in reviewData.indices {
            reviewData[i].isReviewed = false
        }
        persist()
        loadTodayWord()
        updateStats()
    }

    private func persist() {
        guard let encoded = try? JSONEncoder().encode(reviewData) else { return }
        UserDefaults.standard.set(encoded, forKey: reviewDataKey)
    }

    private static func loadReviewData(key: String) -> [ReviewData]? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let decoded = try? JSONDecoder().decode([ReviewData].self, from: data) else {
            return nil
        }
        return decoded
    }

    private static func loadWords() -> [Word] {
        guard let url = Bundle.main.url(forResource: "words", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let words = try? JSONDecoder().decode([Word].self, from: data) else {
            return []
        }
        return words
    }
}
