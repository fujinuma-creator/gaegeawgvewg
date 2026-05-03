import SwiftUI

/// Multiple-choice quiz: show the English word, pick the correct Japanese meaning.
struct QuizView: View {
    @EnvironmentObject var store: WordStore

    @State private var currentWord: Word?
    @State private var choices: [Word] = []
    @State private var selected: UUID? = nil
    @State private var answered = false
    @State private var correctCount = 0
    @State private var totalCount = 0

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("クイズ").font(.title2.bold())
                Spacer()
                Text("\(correctCount) / \(totalCount)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)

            if store.words.count < 4 {
                Spacer()
                VStack(spacing: 10) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 50))
                        .foregroundStyle(.secondary)
                    Text("単語を4つ以上追加するとクイズが始まります")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                }
                .padding()
                Spacer()
            } else if let word = currentWord {
                quizCard(word)
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .onAppear { if currentWord == nil { nextQuestion() } }
    }

    @ViewBuilder
    private func quizCard(_ word: Word) -> some View {
        VStack(spacing: 16) {
            VStack(spacing: 6) {
                Button {
                    SpeechManager.shared.speak(word.word)
                } label: {
                    Image(systemName: "speaker.wave.2.fill")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                        .frame(width: 38, height: 38)
                        .background(Color.indigo)
                        .clipShape(Circle())
                }
                Text(word.word)
                    .font(.system(size: 28, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                Text("使う場面に最も近い意味は？")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .padding(.vertical, 18)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(.secondarySystemGroupedBackground))
            )
            .padding(.horizontal, 16)

            VStack(spacing: 10) {
                ForEach(choices) { choice in
                    choiceButton(choice, correctId: word.id)
                }
            }
            .padding(.horizontal, 16)

            if answered {
                Button {
                    nextQuestion()
                } label: {
                    Text("次の問題 →")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(Color.indigo)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.horizontal, 16)
            }
            Spacer(minLength: 0)
        }
    }

    private func choiceButton(_ choice: Word, correctId: UUID) -> some View {
        let isCorrect = choice.id == correctId
        let isSelected = selected == choice.id
        let bgColor: Color = {
            guard answered else { return Color(.secondarySystemGroupedBackground) }
            if isCorrect { return Color.green.opacity(0.2) }
            if isSelected && !isCorrect { return Color.red.opacity(0.2) }
            return Color(.secondarySystemGroupedBackground)
        }()
        let strokeColor: Color = {
            guard answered else { return Color(.separator) }
            if isCorrect { return Color.green }
            if isSelected && !isCorrect { return Color.red }
            return Color(.separator)
        }()

        return Button {
            guard !answered else { return }
            selected = choice.id
            answered = true
            totalCount += 1
            if isCorrect {
                correctCount += 1
                store.record(mark: .perfect, for: choice)
            } else {
                store.record(mark: .forgot, for: currentWord!)
            }
        } label: {
            HStack(alignment: .top, spacing: 10) {
                Text(choice.definitionJapanese)
                    .multilineTextAlignment(.leading)
                Spacer()
                if answered && isCorrect {
                    Image(systemName: "checkmark.circle.fill").foregroundStyle(.green)
                } else if answered && isSelected && !isCorrect {
                    Image(systemName: "xmark.circle.fill").foregroundStyle(.red)
                }
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(bgColor)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeColor, lineWidth: 1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.primary)
        }
        .disabled(answered)
    }

    private func nextQuestion() {
        guard store.words.count >= 4 else { return }
        let pool = store.words.shuffled()
        let answer = pool[0]
        let distractors = Array(pool.dropFirst().prefix(3))
        var newChoices = ([answer] + distractors).shuffled()
        if newChoices.count < 4 { newChoices = Array(pool.prefix(4)) }
        currentWord = answer
        choices = newChoices
        selected = nil
        answered = false
    }
}

#Preview {
    QuizView()
        .environmentObject(WordStore())
}
