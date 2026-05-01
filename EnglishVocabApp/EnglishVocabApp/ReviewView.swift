import SwiftUI

struct ReviewView: View {
    @EnvironmentObject var store: WordStore
    @State private var currentWord: Word?
    @State private var showAnswer: Bool = false

    var body: some View {
        NavigationStack {
            Group {
                if let word = currentWord {
                    wordCard(word)
                } else {
                    emptyState
                }
            }
            .navigationTitle("今日の復習")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        pickNextDueWord()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .onAppear {
                if currentWord == nil {
                    pickNextDueWord()
                }
            }
        }
    }

    // MARK: - Empty state

    private var emptyState: some View {
        VStack(spacing: 16) {
            Image(systemName: "checkmark.seal.fill")
                .font(.system(size: 64))
                .foregroundStyle(.green)
            Text("今日の復習は完了！")
                .font(.title2.bold())
            Text("次の復習予定までゆっくり休みましょう。")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            if let next = store.words.map(\.nextReviewDate).min() {
                Text("次回: \(next.formatted(date: .abbreviated, time: .omitted))")
                    .font(.callout)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }

    // MARK: - Word card

    @ViewBuilder
    private func wordCard(_ word: Word) -> some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                Text(word.word)
                    .font(.system(size: 34, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                Divider()

                section("英語の定義") {
                    Text(word.definitionEnglish)
                    Text("→ \(word.definitionJapanese)")
                        .foregroundStyle(.secondary)
                }

                if !word.useCases.isEmpty {
                    section("使う場面") {
                        ForEach(word.useCases, id: \.self) { uc in
                            Text("・\(uc)")
                        }
                    }
                }

                if !word.examples.isEmpty {
                    section("例文") {
                        ForEach(Array(word.examples.enumerated()), id: \.element.id) { idx, ex in
                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(idx + 1). \(ex.english)")
                                Text("→ \(ex.japanese)")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.bottom, 4)
                        }
                    }
                }

                if !word.synonyms.isEmpty {
                    section("類義語") {
                        ForEach(word.synonyms) { syn in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(syn.word)（\(syn.meaning)）")
                                    .font(.headline)
                                ForEach(syn.examples) { ex in
                                    VStack(alignment: .leading, spacing: 1) {
                                        Text("• \(ex.english)")
                                        Text("  → \(ex.japanese)")
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            .padding(.bottom, 6)
                        }
                    }
                }

                Divider().padding(.vertical, 4)

                // Review buttons
                HStack(spacing: 12) {
                    reviewButton(.good, color: .green)
                    reviewButton(.fuzzy, color: .orange)
                    reviewButton(.forgot, color: .red)
                }
                .padding(.top, 4)

                // Footer info
                HStack {
                    Text("現段階: \(word.stage.label)")
                    Spacer()
                    Text("次回: \(word.nextReviewDate.formatted(date: .abbreviated, time: .omitted))")
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.top, 4)
            }
            .padding()
        }
    }

    @ViewBuilder
    private func section<Content: View>(
        _ title: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("■ \(title)")
                .font(.headline)
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func reviewButton(_ mark: ReviewMark, color: Color) -> some View {
        Button {
            guard let w = currentWord else { return }
            store.record(mark: mark, for: w)
            pickNextDueWord()
        } label: {
            VStack(spacing: 4) {
                Text(mark.symbol)
                    .font(.system(size: 32, weight: .bold))
                Text(mark.label)
                    .font(.caption)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(color.opacity(0.15))
            .foregroundStyle(color)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(color.opacity(0.5), lineWidth: 1)
            )
        }
    }

    // MARK: - Picking

    private func pickNextDueWord() {
        let due = store.dueWords
        if due.isEmpty {
            currentWord = nil
        } else {
            // Show due words in random order so the same word doesn't always come first.
            let next = due.randomElement()
            currentWord = next
        }
    }
}

#Preview {
    ReviewView()
        .environmentObject(WordStore())
}
