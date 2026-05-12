import SwiftUI

struct WordCardView: View {
    let word: Word
    @Binding var showAnswer: Bool
    let onReview: (ReviewResult) -> Void

    private let accent = Color(red: 0/255, green: 122/255, blue: 255/255)

    var body: some View {
        VStack(spacing: 16) {
            card

            if showAnswer {
                reviewButtons
            }
        }
    }

    private var card: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(word.word)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.black)

            Text(word.pinyin)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.secondary)

            Text(word.japanese)
                .font(.system(size: 16))
                .foregroundColor(accent)
                .padding(.top, 4)

            Text(word.useCase)
                .font(.system(size: 13))
                .italic()
                .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                .padding(.bottom, 8)

            Button(action: { withAnimation { showAnswer.toggle() } }) {
                Text(showAnswer ? "隠す" : "定義を表示")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(accent)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.bottom, 8)

            if showAnswer {
                answerSection
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }

    private var answerSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            (Text("定義: ").bold() + Text(word.definition))
                .font(.system(size: 15))
                .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                .fixedSize(horizontal: false, vertical: true)

            Text("例文:")
                .font(.system(size: 14, weight: .bold))
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 6) {
                ForEach(Array(word.examples.enumerated()), id: \.offset) { _, ex in
                    Text("• \(ex)")
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Text("類義語:")
                .font(.system(size: 14, weight: .bold))
                .padding(.top, 4)

            VStack(alignment: .leading, spacing: 6) {
                ForEach(Array(word.synonyms.enumerated()), id: \.offset) { _, syn in
                    Text("• \(syn)")
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
        .overlay(
            Rectangle()
                .frame(width: 4)
                .foregroundColor(accent),
            alignment: .leading
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private var reviewButtons: some View {
        VStack(spacing: 10) {
            reviewButton(.good, color: Color(red: 52/255, green: 199/255, blue: 89/255))
            reviewButton(.soso, color: Color(red: 255/255, green: 149/255, blue: 0/255))
            reviewButton(.bad, color: Color(red: 255/255, green: 59/255, blue: 48/255))
        }
    }

    private func reviewButton(_ result: ReviewResult, color: Color) -> some View {
        Button(action: { onReview(result) }) {
            Text(result.label)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}
