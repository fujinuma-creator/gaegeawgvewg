import SwiftUI

/// 4-choice grammar quiz, one question at a time. Mirrors the
/// 英語の定義 quiz UX in QuizView: tap a choice → see correct/wrong
/// highlight + Japanese translation + explanation → tap 「次の問題 →」
/// to advance. Position and per-question answer are persisted so the
/// user resumes where they left off across launches.
struct GrammarView: View {
    @EnvironmentObject var store: WordStore
    @AppStorage("grammar.currentIndex") private var currentIndex: Int = 0
    @State private var showResetAlert: Bool = false

    private var questions: [GrammarQuestion] { GrammarMCQSeed.questions }

    private var safeIndex: Int {
        guard !questions.isEmpty else { return 0 }
        return min(max(currentIndex, 0), questions.count - 1)
    }

    private var currentQuestion: GrammarQuestion? {
        guard !questions.isEmpty else { return nil }
        return questions[safeIndex]
    }

    private var answeredCount: Int {
        questions.reduce(0) { $0 + (store.grammarAnswers[$1.id] == nil ? 0 : 1) }
    }

    private var correctCount: Int {
        questions.reduce(0) { acc, q in
            guard let chosen = store.grammarAnswers[q.id] else { return acc }
            return acc + (chosen == q.correctIndex ? 1 : 0)
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            statsHeader
            if questions.isEmpty {
                Spacer()
                emptyView
                Spacer()
            } else if let q = currentQuestion {
                ScrollView {
                    quizCard(q)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                }
            }
        }
        .padding(.top, 8)
        .alert("解答をリセットしますか？", isPresented: $showResetAlert) {
            Button("キャンセル", role: .cancel) {}
            Button("リセット", role: .destructive) {
                store.resetAllGrammarAnswers()
                currentIndex = 0
            }
        } message: {
            Text("\(answeredCount) 問の解答記録をすべて削除し、最初の問題に戻ります。")
        }
    }

    // MARK: - Header

    private var statsHeader: some View {
        VStack(spacing: 6) {
            HStack {
                Text("英文法 4択")
                    .font(.title3.bold())
                Spacer()
                Button {
                    showResetAlert = true
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.counterclockwise")
                        Text("リセット")
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
                .disabled(answeredCount == 0)
                .opacity(answeredCount == 0 ? 0.4 : 1)
            }
            if !questions.isEmpty {
                HStack(spacing: 6) {
                    Text("Q.\(safeIndex + 1) / \(questions.count)")
                        .foregroundStyle(.primary)
                    Spacer()
                    Text("正解 \(correctCount) / \(answeredCount)")
                        .foregroundStyle(.indigo)
                    if answeredCount > 0 {
                        Text("(\(Int(Double(correctCount) / Double(max(answeredCount, 1)) * 100))%)")
                            .foregroundStyle(.tertiary)
                    }
                }
                .font(.subheadline)
                ProgressView(
                    value: Double(safeIndex + 1),
                    total: Double(max(questions.count, 1))
                )
                .tint(.indigo)
            }
        }
        .padding(.horizontal, 16)
    }

    // MARK: - Empty

    private var emptyView: some View {
        VStack(spacing: 10) {
            Image(systemName: "doc.text.magnifyingglass")
                .font(.system(size: 48))
                .foregroundStyle(.indigo.opacity(0.5))
            Text("問題が用意されていません")
                .font(.subheadline.bold())
            Text("新しい4択文法問題が追加されると、ここに表示されます。")
                .font(.caption)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
    }

    // MARK: - Quiz card

    @ViewBuilder
    private func quizCard(_ q: GrammarQuestion) -> some View {
        let selectedIndex = store.grammarAnswers[q.id]
        let answered = selectedIndex != nil
        VStack(alignment: .leading, spacing: 14) {
            // Question number badge
            HStack {
                Text("Q.\(safeIndex + 1)")
                    .font(.caption.bold())
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(Capsule().fill(Color.indigo.opacity(0.15)))
                    .foregroundStyle(.indigo)
                Spacer()
                if answered {
                    if selectedIndex == q.correctIndex {
                        Label("正解", systemImage: "checkmark.circle.fill")
                            .font(.caption.bold())
                            .foregroundStyle(.green)
                    } else {
                        Label("不正解", systemImage: "xmark.circle.fill")
                            .font(.caption.bold())
                            .foregroundStyle(.red)
                    }
                }
            }

            // Question text
            Text(q.question)
                .font(.system(size: 17, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)

            // Choices
            VStack(spacing: 8) {
                ForEach(Array(q.choices.enumerated()), id: \.offset) { i, choice in
                    choiceButton(
                        index: i,
                        text: choice,
                        question: q,
                        selectedIndex: selectedIndex
                    )
                }
            }

            // Explanation panel (after answering)
            if answered {
                explanationView(q)
            }

            // Nav buttons
            navRow(answered: answered)
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.88)))
    }

    private func choiceButton(
        index i: Int,
        text: String,
        question q: GrammarQuestion,
        selectedIndex: Int?
    ) -> some View {
        let answered = selectedIndex != nil
        let isCorrect = i == q.correctIndex
        let isSelected = selectedIndex == i
        let bg: Color = {
            guard answered else { return Color.white.opacity(0.7) }
            if isCorrect { return Color.green.opacity(0.18) }
            if isSelected && !isCorrect { return Color.red.opacity(0.18) }
            return Color.white.opacity(0.7)
        }()
        let stroke: Color = {
            guard answered else { return Color(.separator) }
            if isCorrect { return Color.green }
            if isSelected && !isCorrect { return Color.red }
            return Color(.separator)
        }()
        let label: String = ["a", "b", "c", "d"][safe: i] ?? "\(i)"

        return Button {
            guard !answered else { return }
            store.recordGrammarAnswer(questionId: q.id, selectedIndex: i)
        } label: {
            HStack(alignment: .top, spacing: 10) {
                Text(label + ")")
                    .font(.system(size: 14, weight: .semibold, design: .monospaced))
                    .foregroundStyle(.indigo)
                    .frame(width: 22, alignment: .leading)
                Text(text)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                Spacer()
                if answered && isCorrect {
                    Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                } else if answered && isSelected && !isCorrect {
                    Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                }
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(bg)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(stroke, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.primary)
        }
        .buttonStyle(.plain)
        .disabled(answered)
    }

    private func explanationView(_ q: GrammarQuestion) -> some View {
        let letter = ["a", "b", "c", "d"][safe: q.correctIndex] ?? ""
        let choiceText = q.choices[safe: q.correctIndex] ?? ""
        return VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top, spacing: 6) {
                Text("正解")
                    .font(.caption.bold())
                    .foregroundStyle(.green)
                Text("\(letter)) \(choiceText)")
                    .font(.subheadline.bold())
            }
            Text(q.translation)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Divider()
            Text(q.explanation)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.indigo.opacity(0.08)))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.indigo.opacity(0.35), lineWidth: 1))
    }

    @ViewBuilder
    private func navRow(answered: Bool) -> some View {
        HStack(spacing: 10) {
            Button {
                goPrev()
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left")
                    Text("前の問題")
                }
                .font(.subheadline.bold())
                .padding(.horizontal, 14).padding(.vertical, 10)
                .foregroundStyle(.indigo)
                .background(Capsule().fill(Color.indigo.opacity(0.12)))
            }
            .buttonStyle(.plain)
            .disabled(safeIndex == 0)
            .opacity(safeIndex == 0 ? 0.4 : 1)

            Spacer()

            if answered, let q = currentQuestion {
                Button {
                    store.resetGrammarAnswer(questionId: q.id)
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.counterclockwise")
                        Text("やり直し")
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 10).padding(.vertical, 8)
                    .background(Capsule().fill(Color.gray.opacity(0.12)))
                }
                .buttonStyle(.plain)
            }

            Button {
                goNext()
            } label: {
                HStack(spacing: 6) {
                    Text(isLastQuestion ? "最初に戻る" : "次の問題")
                    Image(systemName: isLastQuestion ? "arrow.uturn.left" : "chevron.right")
                }
                .font(.subheadline.bold())
                .padding(.horizontal, 14).padding(.vertical, 10)
                .foregroundStyle(.white)
                .background(Capsule().fill(Color.indigo))
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 4)
    }

    private var isLastQuestion: Bool {
        guard !questions.isEmpty else { return false }
        return safeIndex >= questions.count - 1
    }

    private func goNext() {
        guard !questions.isEmpty else { return }
        if safeIndex >= questions.count - 1 {
            currentIndex = 0
        } else {
            currentIndex = safeIndex + 1
        }
    }

    private func goPrev() {
        guard !questions.isEmpty else { return }
        if safeIndex > 0 {
            currentIndex = safeIndex - 1
        }
    }
}

private extension Array {
    subscript(safe i: Int) -> Element? {
        indices.contains(i) ? self[i] : nil
    }
}

#Preview {
    GrammarView()
        .environmentObject(WordStore())
}
