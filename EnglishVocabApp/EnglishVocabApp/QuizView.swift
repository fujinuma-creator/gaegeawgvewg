import SwiftUI

/// Multiple-choice quiz: show the English word, pick the correct answer.
/// Two modes are supported, switchable via a segmented control:
/// - 使う場面: pick the situation/scene where the word is used
/// - 英語の定義: pick the English definition
struct QuizView: View {
    @EnvironmentObject var store: WordStore
    @Binding var activeTab: ContentView.Tab

    enum QuizMode: String, CaseIterable, Identifiable {
        case useCase = "使う場面"
        case definition = "英語の定義"
        case translation = "例文翻訳"
        var id: String { rawValue }

        var prompt: String {
            switch self {
            case .useCase:     return "この単語を使う場面はどれ？"
            case .definition:  return "この単語の英語の定義はどれ？"
            case .translation: return "下の日本語を英語に訳してください"
            }
        }

        var minimumEligible: Int {
            // Multiple-choice modes need 4 distinct words for distractors.
            // Translation mode just needs at least 1 word with examples.
            self == .translation ? 1 : 4
        }

        var emptyMessage: String {
            switch self {
            case .useCase:     return "復習リスト内に「使う場面」付きの単語が4つ以上必要です"
            case .definition:  return "復習リスト内に「英語の定義」付きの単語が4つ以上必要です"
            case .translation: return "復習リスト内に「例文」付きの単語が必要です"
            }
        }

        var emptyHint: String {
            "「一覧」タブのチェックで単語を復習リストに追加してください\n（追加から1週間で自動的に消えます）"
        }
    }

    /// One choice = an answer text + the word it belongs to.
    private struct QuizChoice: Identifiable {
        let id = UUID()
        let text: String
        let sourceWord: Word
    }

    @State private var mode: QuizMode = .useCase
    @State private var currentWord: Word?
    @State private var correctChoiceId: UUID? = nil
    @State private var choices: [QuizChoice] = []
    @State private var selectedId: UUID? = nil
    @State private var answered = false
    @State private var correctCount = 0
    @State private var totalCount = 0
    @State private var detailWord: Word? = nil
    @State private var showDetail: Bool = false

    // Translation mode state
    @State private var currentExample: ExampleSentence? = nil
    @State private var userTranslation: String = ""
    @State private var grading: TranslationGrading? = nil
    @State private var isGrading: Bool = false
    @State private var gradingError: String? = nil
    @State private var showGradingError: Bool = false

    private var eligibleWords: [Word] {
        // Quiz draws only from the user's review list (auto-expires after 7 days).
        let pinned = store.reviewListWords
        switch mode {
        case .useCase:
            return pinned.filter { !$0.useCases.isEmpty }
        case .definition:
            return pinned.filter {
                !$0.definitionEnglish.trimmingCharacters(in: .whitespaces).isEmpty
            }
        case .translation:
            return pinned.filter { !$0.examples.isEmpty }
        }
    }

    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("クイズ").font(.title2.bold())
                Spacer()
                Text("\(correctCount) / \(totalCount)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)

            Picker("出題形式", selection: $mode) {
                ForEach(QuizMode.allCases) { m in
                    Text(m.rawValue).tag(m)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 16)

            if eligibleWords.count < mode.minimumEligible {
                Spacer()
                VStack(spacing: 10) {
                    Image(systemName: "star")
                        .font(.system(size: 50))
                        .foregroundStyle(.indigo)
                    Text(mode.emptyMessage)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                    Text(mode.emptyHint)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.tertiary)
                }
                .padding()
                Spacer()
            } else if let word = currentWord {
                if mode == .translation {
                    translationCard(word)
                } else {
                    quizCard(word)
                }
            } else {
                Spacer()
                ProgressView()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .onAppear { if currentWord == nil { nextQuestion() } }
        .onChange(of: mode) { _, _ in
            // Reset session counters and start a fresh question whenever
            // the user switches the quiz format.
            correctCount = 0
            totalCount = 0
            nextQuestion()
        }
        .sheet(isPresented: $showDetail) {
            if let detailWord {
                WordDetailSheet(word: detailWord)
                    .environmentObject(store)
            }
        }
        .onChange(of: activeTab) { _, newValue in
            if newValue != .quiz {
                showDetail = false
            }
        }
        .alert("採点に失敗しました", isPresented: $showGradingError, presenting: gradingError) { _ in
            Button("OK", role: .cancel) {}
        } message: { msg in
            Text(msg)
        }
    }

    private func openDetail(for word: Word) {
        detailWord = word
        showDetail = true
    }

    @ViewBuilder
    private func quizCard(_ word: Word) -> some View {
        // Pull a fresh copy of the word from the store so the checkbox reflects
        // the latest pinned state after toggling.
        let liveWord = store.words.first(where: { $0.id == word.id }) ?? word
        VStack(spacing: 16) {
            VStack(spacing: 6) {
                HStack {
                    Button {
                        store.toggleReviewList(for: liveWord)
                    } label: {
                        HStack(spacing: 4) {
                            Image(systemName: liveWord.isInReviewList ? "checkmark.square.fill" : "square")
                                .font(.system(size: 20))
                            Text(liveWord.isInReviewList ? "復習リストに追加済" : "復習リストに追加")
                                .font(.caption)
                        }
                        .foregroundStyle(liveWord.isInReviewList ? .indigo : .secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            Capsule().fill(
                                liveWord.isInReviewList ? Color.indigo.opacity(0.12) : Color(.tertiarySystemGroupedBackground)
                            )
                        )
                        .contentShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }

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
                Button {
                    openDetail(for: word)
                } label: {
                    HStack(spacing: 6) {
                        Text(word.word)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(.primary)
                        Image(systemName: "info.circle.fill")
                            .font(.system(size: 18))
                            .foregroundStyle(.indigo)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Text("タップで詳細（意味・例文・類義語）を表示")
                    .font(.caption2)
                    .foregroundStyle(.indigo)

                Text(mode.prompt)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .padding(.top, 4)
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
                Text(choice.text)
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
            Button {
                openDetail(for: word)
            } label: {
                HStack {
                    Text("正解の単語: \(word.word)")
                        .font(.subheadline.bold())
                        .foregroundStyle(.indigo)
                    Image(systemName: "chevron.right")
                        .font(.caption2)
                        .foregroundStyle(.indigo)
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            Text(word.definitionJapanese)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            if let selectedChoice = choices.first(where: { $0.id == selectedId }),
               selectedChoice.id != correctChoiceId {
                Divider().padding(.vertical, 4)
                Button {
                    openDetail(for: selectedChoice.sourceWord)
                } label: {
                    HStack {
                        Text(wrongChoiceCopy(for: selectedChoice.sourceWord))
                            .font(.caption)
                            .foregroundStyle(.red.opacity(0.85))
                            .multilineTextAlignment(.leading)
                        Image(systemName: "chevron.right")
                            .font(.caption2)
                            .foregroundStyle(.red.opacity(0.85))
                    }
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
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
        let pool = eligibleWords.shuffled()
        guard pool.count >= mode.minimumEligible else {
            currentWord = nil
            choices = []
            currentExample = nil
            return
        }

        if mode == .translation {
            let answerWord = pool[0]
            guard let example = answerWord.examples.randomElement() else { return }
            currentWord = answerWord
            currentExample = example
            userTranslation = ""
            grading = nil
            answered = false
            return
        }

        let answerWord = pool[0]
        guard let correctText = choiceText(for: answerWord) else { return }

        let distractorWords = pool.dropFirst().prefix(3)
        let distractors: [QuizChoice] = distractorWords.compactMap { dw in
            guard let t = choiceText(for: dw) else { return nil }
            return QuizChoice(text: t, sourceWord: dw)
        }
        guard distractors.count == 3 else { return }

        let correctChoice = QuizChoice(text: correctText, sourceWord: answerWord)
        let allChoices = ([correctChoice] + distractors).shuffled()

        currentWord = answerWord
        correctChoiceId = correctChoice.id
        choices = allChoices
        selectedId = nil
        answered = false
    }

    /// Picks the answer text for a word based on the current quiz mode.
    private func choiceText(for word: Word) -> String? {
        switch mode {
        case .useCase:
            return word.useCases.randomElement()
        case .definition:
            let def = word.definitionEnglish.trimmingCharacters(in: .whitespaces)
            return def.isEmpty ? nil : def
        }
    }

    private func wrongChoiceCopy(for sourceWord: Word) -> String {
        switch mode {
        case .useCase:
            return "選んだ場面は「\(sourceWord.word)」の使い方です"
        case .definition:
            return "選んだ定義は「\(sourceWord.word)」のものです"
        case .translation:
            return ""  // not used in translation mode
        }
    }

    // MARK: - Translation card

    @ViewBuilder
    private func translationCard(_ word: Word) -> some View {
        let liveWord = store.words.first(where: { $0.id == word.id }) ?? word
        ScrollView {
            VStack(spacing: 16) {
                VStack(spacing: 10) {
                    HStack {
                        Button {
                            store.toggleReviewList(for: liveWord)
                        } label: {
                            HStack(spacing: 4) {
                                Image(systemName: liveWord.isInReviewList ? "checkmark.square.fill" : "square")
                                    .font(.system(size: 18))
                                Text(liveWord.isInReviewList ? "復習リストに追加済" : "復習リストに追加")
                                    .font(.caption)
                            }
                            .foregroundStyle(liveWord.isInReviewList ? .indigo : .secondary)
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .background(Capsule().fill(liveWord.isInReviewList ? Color.indigo.opacity(0.12) : Color(.tertiarySystemGroupedBackground)))
                        }
                        .buttonStyle(.plain)
                        Spacer()
                    }

                    Button {
                        openDetail(for: word)
                    } label: {
                        HStack(spacing: 6) {
                            Text(word.word)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.primary)
                            Image(systemName: "info.circle.fill")
                                .foregroundStyle(.indigo)
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)

                    if let ex = currentExample {
                        VStack(spacing: 6) {
                            Text("下の日本語を英語に訳してください")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(ex.japanese)
                                .font(.system(size: 20, weight: .medium))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical, 18)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color(.secondarySystemGroupedBackground)))
                .padding(.horizontal, 16)

                VStack(alignment: .leading, spacing: 8) {
                    Text("あなたの英訳").font(.caption).foregroundStyle(.secondary)
                    TextEditor(text: $userTranslation)
                        .frame(minHeight: 90)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color(.secondarySystemGroupedBackground)))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.separator), lineWidth: 0.5))
                        .textInputAutocapitalization(.sentences)
                        .autocorrectionDisabled(false)
                        .disabled(answered || isGrading)
                }
                .padding(.horizontal, 16)

                if !answered {
                    Button {
                        Task { await gradeNow(for: word) }
                    } label: {
                        HStack {
                            Spacer()
                            if isGrading {
                                ProgressView().tint(.white).padding(.trailing, 4)
                                Text("採点中…").bold()
                            } else {
                                Image(systemName: "checkmark.seal.fill")
                                Text("AIで採点").bold()
                            }
                            Spacer()
                        }
                        .padding(.vertical, 14)
                        .foregroundStyle(.white)
                        .background(canGrade ? Color.indigo : Color.indigo.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .disabled(!canGrade || isGrading)
                    .padding(.horizontal, 16)
                }

                if let g = grading {
                    gradingResultView(g)
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

                Spacer(minLength: 12)
            }
        }
    }

    private var canGrade: Bool {
        !userTranslation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    @ViewBuilder
    private func gradingResultView(_ g: TranslationGrading) -> some View {
        let color: Color = g.isCorrect ? .green : (g.isClose ? .orange : .red)
        let label: String = g.isCorrect ? "◯ 正解" : (g.isClose ? "△ 惜しい" : "× 不正解")

        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(label)
                    .font(.headline)
                    .foregroundStyle(color)
                Spacer()
                Text("\(g.score) / 100")
                    .font(.subheadline.bold())
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("お手本の英訳").font(.caption).foregroundStyle(.tertiary)
                HStack(alignment: .top, spacing: 8) {
                    Button {
                        SpeechManager.shared.speak(g.corrected)
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 11))
                            .foregroundStyle(.indigo)
                            .frame(width: 24, height: 24)
                            .background(Color.indigo.opacity(0.1))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                    Text(g.corrected)
                        .font(.body)
                }
            }
            VStack(alignment: .leading, spacing: 4) {
                Text("解説").font(.caption).foregroundStyle(.tertiary)
                Text(g.explanation)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.10))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(color.opacity(0.5), lineWidth: 1)
        )
    }

    @MainActor
    private func gradeNow(for word: Word) async {
        guard let example = currentExample else { return }
        let userText = userTranslation.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !userText.isEmpty else { return }

        isGrading = true
        defer { isGrading = false }

        do {
            let result = try await GeminiService.gradeTranslation(
                targetWord: word.word,
                japanese: example.japanese,
                referenceEnglish: example.english,
                userEnglish: userText
            )
            grading = result
            answered = true
            totalCount += 1

            // Map verdict back to the review-tracking system.
            if result.isCorrect {
                correctCount += 1
                store.record(mark: .perfect, for: word)
            } else if result.isClose {
                store.record(mark: .fuzzy, for: word)
            } else {
                store.record(mark: .forgot, for: word)
            }
        } catch {
            gradingError = error.localizedDescription
            showGradingError = true
        }
    }
}

// MARK: - Word detail sheet (reusable)

struct WordDetailSheet: View {
    let initialWord: Word
    @EnvironmentObject var store: WordStore
    @Environment(\.dismiss) private var dismiss
    @State private var isRegenerating: Bool = false
    @State private var regenerateError: String? = nil
    @State private var showRegenerateError: Bool = false

    init(word: Word) {
        self.initialWord = word
    }

    /// Always read the live word from the store so example regeneration shows
    /// up immediately in this sheet.
    private var word: Word {
        store.words.first(where: { $0.id == initialWord.id }) ?? initialWord
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top) {
                        Button {
                            SpeechManager.shared.speak(word.word)
                        } label: {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 18))
                                .foregroundStyle(.white)
                                .frame(width: 44, height: 44)
                                .background(Color.indigo)
                                .clipShape(Circle())
                        }
                        Spacer()
                        statusBadge(word.status)
                    }

                    VStack(alignment: .leading, spacing: 4) {
                        Text(word.word)
                            .font(.system(size: 30, weight: .bold))
                        Text(word.definitionJapanese)
                            .foregroundStyle(.secondary)
                    }

                    Divider()

                    sectionTitle("英語の定義")
                    HStack(alignment: .top, spacing: 8) {
                        smallSpeakerButton(text: word.definitionEnglish)
                        Text(word.definitionEnglish).italic()
                    }

                    if !word.useCases.isEmpty {
                        sectionTitle("使う場面")
                        VStack(alignment: .leading, spacing: 6) {
                            ForEach(word.useCases, id: \.self) { uc in
                                HStack(alignment: .firstTextBaseline, spacing: 8) {
                                    Circle().fill(Color.indigo).frame(width: 5, height: 5)
                                    Text(uc)
                                }
                            }
                        }
                    }

                    if !word.examples.isEmpty {
                        HStack {
                            sectionTitle("例文")
                            Spacer()
                            Button {
                                Task { await regenerateExamples() }
                            } label: {
                                HStack(spacing: 4) {
                                    if isRegenerating {
                                        ProgressView().scaleEffect(0.7)
                                        Text("生成中…")
                                    } else {
                                        Image(systemName: "sparkles")
                                        Text("新しい例文を生成")
                                    }
                                }
                                .font(.caption)
                                .foregroundStyle(.indigo)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 6)
                                .background(Capsule().fill(Color.indigo.opacity(0.12)))
                            }
                            .buttonStyle(.plain)
                            .disabled(isRegenerating)
                        }
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(word.examples) { ex in
                                HStack(alignment: .top, spacing: 8) {
                                    smallSpeakerButton(text: ex.english)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(ex.english)
                                        Text(ex.japanese)
                                            .foregroundStyle(.secondary)
                                            .font(.subheadline)
                                    }
                                }
                            }
                        }
                    }

                    if !word.synonyms.isEmpty {
                        sectionTitle("類義語")
                        VStack(alignment: .leading, spacing: 12) {
                            ForEach(word.synonyms) { syn in
                                synonymCard(syn)
                            }
                        }
                    }

                    HStack {
                        Text("復習回数: \(word.reviewCount) 回")
                        Spacer()
                        Text("次回: \(word.nextReviewDate.formatted(date: .abbreviated, time: .omitted))")
                    }
                    .font(.caption)
                    .foregroundStyle(.tertiary)
                    .padding(.top, 8)
                }
                .padding(20)
            }
            .background(Color(.systemGroupedBackground).ignoresSafeArea())
            .navigationTitle(word.word)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("閉じる") { dismiss() }
                }
            }
            .alert("例文の生成に失敗しました", isPresented: $showRegenerateError, presenting: regenerateError) { _ in
                Button("OK", role: .cancel) {}
            } message: { msg in
                Text(msg)
            }
        }
    }

    @MainActor
    private func regenerateExamples() async {
        isRegenerating = true
        defer { isRegenerating = false }
        do {
            let new = try await GeminiService.regenerateExamples(for: word)
            let mapped = new.map { ExampleSentence(english: $0.english, japanese: $0.japanese) }
            store.updateExamples(for: word.id, with: mapped)
        } catch {
            regenerateError = error.localizedDescription
            showRegenerateError = true
        }
    }

    private func sectionTitle(_ title: String) -> some View {
        HStack(spacing: 6) {
            Rectangle().fill(Color.indigo).frame(width: 3, height: 14)
            Text(title)
                .font(.subheadline.weight(.medium))
                .foregroundStyle(.secondary)
        }
    }

    private func smallSpeakerButton(text: String) -> some View {
        Button {
            SpeechManager.shared.speak(text)
        } label: {
            Image(systemName: "speaker.wave.2.fill")
                .font(.system(size: 11))
                .foregroundStyle(.indigo)
                .frame(width: 24, height: 24)
                .background(Color.indigo.opacity(0.1))
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }

    private func statusBadge(_ status: WordStatus) -> some View {
        let color: Color = {
            switch status {
            case .unlearned: return .gray
            case .fuzzy:     return .orange
            case .perfect:   return .indigo
            }
        }()
        return Text(status.label)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(Capsule().fill(color.opacity(0.15)))
            .foregroundStyle(color)
    }

    @ViewBuilder
    private func synonymCard(_ syn: SynonymGroup) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                smallSpeakerButton(text: syn.word)
                Text(syn.word)
                    .font(.headline)
                    .foregroundStyle(.indigo)
                Text(syn.meaning)
                    .foregroundStyle(.secondary)
            }
            if !syn.definitionEnglish.isEmpty {
                HStack(alignment: .top, spacing: 8) {
                    smallSpeakerButton(text: syn.definitionEnglish)
                    Text(syn.definitionEnglish).italic().font(.subheadline)
                }
            }
            if !syn.useCases.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(syn.useCases, id: \.self) { uc in
                        HStack(spacing: 6) {
                            Circle().fill(Color.indigo).frame(width: 4, height: 4)
                            Text(uc).font(.subheadline)
                        }
                    }
                }
            }
            if !syn.examples.isEmpty {
                ForEach(syn.examples) { ex in
                    HStack(alignment: .top, spacing: 8) {
                        smallSpeakerButton(text: ex.english)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(ex.english).font(.subheadline)
                            Text(ex.japanese).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(.tertiarySystemGroupedBackground)))
    }
}

#Preview {
    QuizView(activeTab: .constant(.quiz))
        .environmentObject(WordStore())
}
