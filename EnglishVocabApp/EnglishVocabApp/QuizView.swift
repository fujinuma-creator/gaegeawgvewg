import SwiftUI

/// Multiple-choice quiz: show the English word, pick the correct "use case" (situation).
struct QuizView: View {
    @EnvironmentObject var store: WordStore

    /// One choice = a use case sentence + the word it belongs to.
    private struct QuizChoice: Identifiable {
        let id = UUID()
        let useCase: String
        let sourceWord: Word
    }

    @State private var currentWord: Word?
    @State private var correctChoiceId: UUID? = nil
    @State private var choices: [QuizChoice] = []
    @State private var selectedId: UUID? = nil
    @State private var answered = false
    @State private var correctCount = 0
    @State private var totalCount = 0

    private var wordsWithUseCases: [Word] {
        store.words.filter { !$0.useCases.isEmpty }
    }

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

            if wordsWithUseCases.count < 4 {
                Spacer()
                VStack(spacing: 10) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 50))
                        .foregroundStyle(.secondary)
                    Text("「使う場面」付きの単語が4つ以上必要です")
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
                Text("この単語を使う場面はどれ？")
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
                    choiceButton(choice)
                }
            }
            .padding(.horizontal, 16)

            if answered, let word = currentWord {
                answerExplanation(word)
                    .padding(.horizontal, 16)
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

    private func choiceButton(_ choice: QuizChoice) -> some View {
        let isCorrect = choice.id == correctChoiceId
        let isSelected = selectedId == choice.id
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
            selectedId = choice.id
            answered = true
            totalCount += 1
            guard let word = currentWord else { return }
            if isCorrect {
                correctCount += 1
                store.record(mark: .perfect, for: word)
            } else {
                store.record(mark: .forgot, for: word)
            }
        } label: {
            HStack(alignment: .top, spacing: 10) {
                Text(choice.useCase)
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

    /// Shows the chosen wrong answer's source word + the correct word's full meaning,
    /// so the user can learn from each question.
    @ViewBuilder
    private func answerExplanation(_ word: Word) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("正解の単語: \(word.word)")
                .font(.subheadline.bold())
                .foregroundStyle(.indigo)
            Text(word.definitionJapanese)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            if let selectedChoice = choices.first(where: { $0.id == selectedId }),
               selectedChoice.id != correctChoiceId {
                Divider().padding(.vertical, 4)
                Text("選んだ場面は「\(selectedChoice.sourceWord.word)」の使い方です")
                    .font(.caption)
                    .foregroundStyle(.red.opacity(0.85))
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.tertiarySystemGroupedBackground))
        )
    }

    private func nextQuestion() {
        let pool = wordsWithUseCases.shuffled()
        guard pool.count >= 4 else { return }

        let answerWord = pool[0]
        guard let correctUseCase = answerWord.useCases.randomElement() else { return }

        // Pick distractor use cases from 3 different other words.
        let distractorWords = pool.dropFirst().prefix(3)
        let distractors: [QuizChoice] = distractorWords.compactMap { dw in
            guard let uc = dw.useCases.randomElement() else { return nil }
            return QuizChoice(useCase: uc, sourceWord: dw)
        }
        guard distractors.count == 3 else { return }

        let correctChoice = QuizChoice(useCase: correctUseCase, sourceWord: answerWord)
        let allChoices = ([correctChoice] + distractors).shuffled()

        currentWord = answerWord
        correctChoiceId = correctChoice.id
        choices = allChoices
        selectedId = nil
        answered = false
    }
}

#Preview {
    QuizView()
        .environmentObject(WordStore())
}
