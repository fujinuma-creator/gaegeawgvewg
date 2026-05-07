import SwiftUI

/// 4-choice grammar question list. Each curated question is rendered as
/// a card; tapping a choice locks the answer, reveals the correct option,
/// the Japanese translation, and a bullet-style explanation.
/// User's selected option is persisted via `WordStore.grammarAnswers`.
struct GrammarView: View {
    @EnvironmentObject var store: WordStore
    @State private var showResetAlert: Bool = false

    private var questions: [GrammarQuestion] { GrammarMCQSeed.questions }

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
        VStack(spacing: 0) {
            statsHeader
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(Array(questions.enumerated()), id: \.element.id) { idx, q in
                        questionCard(index: idx, question: q)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
            }
        }
        .alert("解答をリセットしますか？", isPresented: $showResetAlert) {
            Button("キャンセル", role: .cancel) {}
            Button("リセット", role: .destructive) {
                store.resetAllGrammarAnswers()
            }
        } message: {
            Text("\(answeredCount) 問の解答記録をすべて削除します。")
        }
    }

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
            HStack(spacing: 6) {
                Text("正解: \(correctCount) / \(questions.count)")
                    .foregroundStyle(.indigo)
                Text("·")
                Text("解答済: \(answeredCount) / \(questions.count)")
                    .foregroundStyle(.secondary)
                Spacer()
                if answeredCount > 0 {
                    Text("\(Int(Double(correctCount) / Double(max(answeredCount, 1)) * 100))%")
                        .foregroundStyle(.tertiary)
                }
            }
            .font(.subheadline)
            ProgressView(value: Double(answeredCount), total: Double(max(questions.count, 1)))
                .tint(.indigo)
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .padding(.bottom, 4)
    }

    @ViewBuilder
    private func questionCard(index: Int, question q: GrammarQuestion) -> some View {
        let selectedIndex = store.grammarAnswers[q.id]
        let answered = selectedIndex != nil
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Q\(index + 1)")
                    .font(.caption.bold())
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
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
                    Button {
                        store.resetGrammarAnswer(questionId: q.id)
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .buttonStyle(.plain)
                }
            }

            Text(q.question)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)

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

            if answered {
                explanationView(q)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.85)))
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
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(bg)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(stroke, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 8))
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
