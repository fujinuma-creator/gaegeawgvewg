import SwiftUI

/// Multiple-choice quiz: show the English word, pick the correct answer.
/// Two modes are supported, switchable via a segmented control:
/// - 使う場面: pick the situation/scene where the word is used
/// - 英語の定義: pick the English definition
struct QuizView: View {
    @EnvironmentObject var store: WordStore
    @Binding var activeTab: ContentView.Tab

    enum QuizMode: String, CaseIterable, Identifiable {
        // Declaration order drives the segmented control order:
        // 例文翻訳 (left) → 使う場面 (middle) → 英語の定義 (right).
        case translation = "例文翻訳"
        case useCase = "使う場面"
        case definition = "英語の定義"
        /// Swipe-through flashcards drawn from the 復習リスト（会話頻度順）
        /// table. Has its own menu screen (今日の単語 / 復習単語 / 全部の単語).
        case wordReview = "単語復習"
        var id: String { rawValue }

        /// Stable English key used for Word.modeCounts /
        /// Word.modeNextReviewDates dictionaries. Independent of the
        /// localized rawValue display name.
        var modeKey: String {
            switch self {
            case .useCase:     return "useCase"
            case .definition:  return "definition"
            case .translation: return "translation"
            case .wordReview:  return "wordReview"
            }
        }

        var prompt: String {
            switch self {
            case .useCase:     return "この単語を使う場面はどれ？"
            case .definition:  return "この単語の英語の定義はどれ？"
            case .translation: return "下の日本語を英語に訳してください"
            case .wordReview:  return ""
            }
        }

        var minimumEligible: Int {
            // Multiple-choice modes need 4 distinct words for distractors.
            // Translation / word review only need 1.
            (self == .translation || self == .wordReview) ? 1 : 4
        }

        var emptyMessage: String {
            switch self {
            case .useCase:     return "復習リスト内に「使う場面」付きの単語が4つ以上必要です"
            case .definition:  return "復習リスト内に「英語の定義」付きの単語が4つ以上必要です"
            case .translation: return "本日分の例文がありません"
            case .wordReview:  return "単語が登録されていません"
            }
        }

        var emptyHint: String {
            "復習リストには毎週500語が自動で追加されます。「カード」や「クイズ」のチェックからも追加できます"
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
    /// Drag offset used to animate the translation question card while the
    /// user is swiping between problems (Tinder-style follow-the-finger).
    @State private var translationDragOffset: CGSize = .zero
    /// Whether the in-progress drag is moving the card (nil until decided at
    /// the start of the drag; false means the ScrollView gets it instead).
    @State private var translationDragFollows: Bool? = nil

    // Translation mode state — the picked problem persists until the user
    // explicitly changes it (saved to AppStorage so it survives app launches).
    @State private var currentExample: ExampleSentence? = nil
    @State private var showAnswer: Bool = false
    @AppStorage("translation.wordId") private var savedTranslationWordId: String = ""
    @AppStorage("translation.exampleIdx") private var savedTranslationExampleIdx: Int = 0

    // AI assistance state for the current translation problem.
    @State private var isFetchingGrammar: Bool = false
    @State private var aiErrorMessage: String? = nil
    @State private var showAIError: Bool = false

    /// Words from the review list eligible to be the *question* for the
    /// current mode: per-mode count < 4 AND per-mode next-review date is
    /// on/before now (Ebbinghaus). Each (word, mode) pair tracks its own
    /// progress.
    private var eligibleWords: [Word] {
        let now = Date()
        let key = mode.modeKey
        let pinned = store.reviewListWords.filter { word in
            let count = word.modeCounts[key] ?? 0
            let nextDate = word.modeNextReviewDates[key] ?? .distantPast
            return count < 4 && nextDate <= now
        }
        return filterByModeContent(pinned)
    }

    /// Distractor pool for multiple-choice modes: any pinned word whose
    /// per-mode count is still < 4 (Ebbinghaus-agnostic) so we can always
    /// assemble 4 options.
    private var distractorPool: [Word] {
        let key = mode.modeKey
        let pinned = store.reviewListWords.filter { word in
            (word.modeCounts[key] ?? 0) < 4
        }
        return filterByModeContent(pinned)
    }

    private func filterByModeContent(_ words: [Word]) -> [Word] {
        switch mode {
        case .useCase:
            return words.filter { !$0.useCases.isEmpty }
        case .definition:
            return words.filter {
                !$0.definitionEnglish.trimmingCharacters(in: .whitespaces).isEmpty
            }
        case .translation:
            return words.filter { !$0.examples.isEmpty }
        case .wordReview:
            return words   // not used: word review has its own data source
        }
    }

    /// Can we actually run the quiz right now?
    private var canShowQuiz: Bool {
        switch mode {
        case .useCase, .definition:
            guard !eligibleWords.isEmpty else { return false }
            return distractorPool.count >= 4
        case .translation:
            // Translation is driven by the daily example plan, not the
            // review list, so it only needs today's Day to be non-empty.
            return !translationQueue.isEmpty
        case .wordReview:
            // Word review manages its own empty states inside its menu.
            return true
        }
    }

    /// True when the user has at least one word pinned but no eligible
    /// question word remains today (everything is either 復習完了 or
    /// scheduled out by the Ebbinghaus curve). Triggers the
    /// "本日のタスクは終了しました" celebration view.
    private var allTasksDone: Bool {
        // Translation never "runs out": it always serves today's Day.
        guard mode != .translation, mode != .wordReview else { return false }
        return !store.reviewListWords.isEmpty && eligibleWords.isEmpty
    }


    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("クイズ").font(.title2.bold())
                Spacer()
                // Word review deliberately shows no score / counter up top;
                // its "X / N" position lives just above the word instead.
                if mode != .wordReview {
                    Text("\(correctCount) / \(totalCount)")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
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

            if mode == .wordReview {
                WordReviewView()
                    .environmentObject(store)
            } else if !canShowQuiz {
                Spacer()
                if allTasksDone {
                    VStack(spacing: 12) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 56))
                            .foregroundStyle(.green)
                        Text("本日のタスクは終了しました")
                            .font(.title3.bold())
                            .multilineTextAlignment(.center)
                        Text("復習リスト内の単語はすべて復習完了、または次回出題まで間隔を置いた状態です。")
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal, 24)
                    }
                } else {
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
                }
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
        .background(GeometricBackground().ignoresSafeArea())
        .onAppear { if currentWord == nil { nextQuestion() } }
        .onChange(of: mode) { _, _ in
            // Reset session counters and start a fresh question whenever
            // the user switches the quiz format.
            correctCount = 0
            totalCount = 0
            nextQuestion()
        }
        // `.sheet(item:)` rather than `isPresented` + a separate state var:
        // with the latter, the sheet body is built before `detailWord` has
        // been committed, so the *first* tap opened an empty sheet.
        .sheet(item: $detailWord) { w in
            WordDetailSheet(word: w)
                .environmentObject(store)
        }
        .onChange(of: activeTab) { _, newValue in
            if newValue != .quiz {
                detailWord = nil
            }
        }
    }

    private func openDetail(for word: Word) {
        detailWord = word
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
                                liveWord.isInReviewList ? Color.indigo.opacity(0.12) : Color.white.opacity(0.7)
                            )
                        )
                        .contentShape(Capsule())
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }

                reviewGauge(for: liveWord)
                    .padding(.horizontal, 4)
                    .padding(.bottom, 4)

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
                    VStack(spacing: 4) {
                        HStack(spacing: 6) {
                            Text(word.word)
                                .font(.system(size: 28, weight: .bold))
                                .foregroundStyle(.primary)
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 18))
                                .foregroundStyle(.indigo)
                        }
                        if let ipa = word.ipa, !ipa.isEmpty {
                            Text(ipa)
                                .font(.system(size: 14, design: .serif))
                                .foregroundStyle(.indigo.opacity(0.85))
                        }
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
                    .fill(Color.white.opacity(0.82))
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
            guard answered else { return Color.white.opacity(0.82) }
            if isCorrect { return Color.green.opacity(0.2) }
            if isSelected && !isCorrect { return Color.red.opacity(0.2) }
            return Color.white.opacity(0.82)
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
                store.recordModeAnswer(.perfect, for: word, modeKey: mode.modeKey)
            } else {
                store.recordModeAnswer(.forgot, for: word, modeKey: mode.modeKey)
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
                .fill(Color.white.opacity(0.7))
        )
    }

    private func nextQuestion() {
        guard canShowQuiz, mode != .wordReview else {
            currentWord = nil
            choices = []
            currentExample = nil
            return
        }

        if mode == .translation {
            // Translation: try to restore the saved problem first; only pick a
            // fresh one if no problem was previously saved or the saved word
            // no longer exists in the store.
            if let saved = loadSavedTranslationProblem() {
                currentWord = saved.word
                currentExample = saved.example
                showAnswer = false
                answered = false
            } else {
                pickFreshTranslationProblem()
            }
            return
        }

        // Multiple choice: question word from eligibleWords (due + not
        // completed), distractors from the broader distractorPool so we can
        // always assemble 4 options even if only one or two words are due.
        let dueShuffled = eligibleWords.shuffled()
        guard let answerWord = dueShuffled.first else { return }
        guard let correctText = choiceText(for: answerWord) else { return }

        let distractorWords = distractorPool
            .filter { $0.id != answerWord.id }
            .shuffled()
            .prefix(3)
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
    /// Translation mode doesn't use multiple-choice, so it returns nil.
    private func choiceText(for word: Word) -> String? {
        switch mode {
        case .useCase:
            return word.useCases.randomElement()
        case .definition:
            let def = word.definitionEnglish.trimmingCharacters(in: .whitespaces)
            return def.isEmpty ? nil : def
        case .translation, .wordReview:
            return nil
        }
    }

    private func wrongChoiceCopy(for sourceWord: Word) -> String {
        switch mode {
        case .useCase:
            return "選んだ場面は「\(sourceWord.word)」の使い方です"
        case .definition:
            return "選んだ定義は「\(sourceWord.word)」のものです"
        case .translation, .wordReview:
            return ""  // not used in these modes
        }
    }

    // MARK: - Translation card (no AI grading; pre-prepared answer + change button)

    @ViewBuilder
    private func translationCard(_ word: Word) -> some View {
        let liveWord = store.words.first(where: { $0.id == word.id }) ?? word
        let queue = translationQueue
        let position = currentQueuePosition(in: queue)
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
                            .background(Capsule().fill(liveWord.isInReviewList ? Color.indigo.opacity(0.12) : Color.white.opacity(0.7)))
                        }
                        .buttonStyle(.plain)
                        Spacer()
                        Text("Day \(translationDay)")
                            .font(.caption2.bold())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 3)
                            .background(Capsule().fill(Color.indigo))
                        Text("\(position + 1) / \(max(queue.count, 1))")
                            .font(.caption.bold())
                            .foregroundStyle(.secondary)
                    }

                    reviewGauge(for: liveWord)
                        .padding(.vertical, 2)

                    if let ex = currentExample {
                        VStack(spacing: 6) {
                            Text("下の日本語を英語に訳してください")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Text(ex.japanese)
                                .font(.system(size: 22, weight: .medium))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                    }

                    HStack(spacing: 6) {
                        Image(systemName: showAnswer ? "eye.slash" : "hand.tap")
                        Text(showAnswer ? "タップで答えを隠す" : "タップで答えを表示")
                    }
                    .font(.caption2.bold())
                    .foregroundStyle(.indigo)
                    .padding(.top, 6)

                    HStack {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("左で前")
                        }
                        Spacer()
                        HStack(spacing: 4) {
                            Text("右で次")
                            Image(systemName: "chevron.right")
                        }
                    }
                    .font(.caption2)
                    .foregroundStyle(.secondary)
                    .padding(.top, 4)
                }
                .padding(.vertical, 18)
                .padding(.horizontal, 14)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.82)))
                .padding(.horizontal, 16)
                .offset(x: translationDragOffset.width, y: translationDragOffset.height)
                .rotationEffect(.degrees(Double(translationDragOffset.width) / 22))
                .overlay(translationSwipeHint.allowsHitTesting(false))
                .contentShape(Rectangle())
                // Tap the question card to reveal the answer, tap again to
                // hide it. (Replaces the old 答えを見る button.) The swipe
                // gesture needs 12pt of movement, so it never eats the tap.
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        showAnswer.toggle()
                    }
                }
                .gesture(translationSwipeGesture)

                if showAnswer, let ex = currentExample, let w = currentWord {
                    // The answer card swipes between problems too, so the
                    // user doesn't have to scroll back up to the question.
                    answerView(ex, word: w)
                        .padding(.horizontal, 16)
                        .offset(x: translationDragOffset.width, y: translationDragOffset.height)
                        .contentShape(Rectangle())
                        .gesture(translationSwipeGesture)
                    aiAssistSection(for: ex)
                        .padding(.horizontal, 16)
                    selfRateRow(for: w)
                        .padding(.horizontal, 16)
                }

                Spacer(minLength: 12)
            }
        }
        .alert("AI 呼び出しに失敗しました", isPresented: $showAIError, presenting: aiErrorMessage) { _ in
            Button("OK", role: .cancel) {}
        } message: { msg in
            Text(msg)
        }
    }

    // MARK: - Translation queue / navigation

    /// The Day of the example study plan being served today. Advances by one
    /// every calendar day (Day 1 → Day 2 → Day 3 …).
    private var translationDay: Int {
        ExamplePlan.currentDay(in: store.words)
    }

    /// The problems for the quiz, taken straight from today's Day in the
    /// 例文 list (60 sentences, same order as shown there) — not random.
    private var translationQueue: [(word: Word, exampleIdx: Int)] {
        ExamplePlan.pairs(forDay: translationDay, in: store.words)
    }

    private func currentQueuePosition(in queue: [(word: Word, exampleIdx: Int)]) -> Int {
        guard let w = currentWord, let ex = currentExample,
              let exIdx = w.examples.firstIndex(where: { $0.id == ex.id }) else { return 0 }
        return queue.firstIndex { $0.word.id == w.id && $0.exampleIdx == exIdx } ?? 0
    }

    /// Drag used to move between translation problems. The card follows the
    /// finger freely in every direction; only the horizontal distance decides
    /// whether we advance (right = next, left = previous) or spring back.
    ///
    /// Direction handling: while the answer is hidden the page has nothing to
    /// scroll, so the card follows the finger no matter which way the drag
    /// starts. Once the answer is shown the page becomes scrollable, so a drag
    /// that starts vertically is handed to the ScrollView instead. The choice
    /// is made once at the start of each drag and then held, so a swipe that
    /// begins sideways keeps following the finger even if it curves upward.
    private var translationSwipeGesture: some Gesture {
        DragGesture(minimumDistance: 8)
            .onChanged { value in
                if translationDragFollows == nil {
                    let dx = abs(value.translation.width)
                    let dy = abs(value.translation.height)
                    guard max(dx, dy) >= 8 else { return }
                    translationDragFollows = showAnswer ? (dx >= dy) : true
                }
                guard translationDragFollows == true else { return }
                translationDragOffset = value.translation
            }
            .onEnded { value in
                let wasFollowing = (translationDragFollows == true)
                translationDragFollows = nil
                let threshold: CGFloat = 50
                if wasFollowing, value.translation.width > threshold {
                    flyOffTranslation(direction: 1) { nextProblem() }
                } else if wasFollowing, value.translation.width < -threshold {
                    flyOffTranslation(direction: -1) { prevProblem() }
                } else {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                        translationDragOffset = .zero
                    }
                }
            }
    }

    /// Visual hint that appears as the user holds the translation card to one
    /// side, so it's clear which way the swipe is going.
    @ViewBuilder
    private var translationSwipeHint: some View {
        let progress = min(abs(translationDragOffset.width) / 50, 1.0)
        if progress > 0.05 {
            let isRight = translationDragOffset.width > 0
            HStack {
                if !isRight {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.indigo.opacity(0.55 * progress))
                        .padding(.leading, 20)
                    Spacer()
                } else {
                    Spacer()
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.system(size: 60))
                        .foregroundStyle(.indigo.opacity(0.55 * progress))
                        .padding(.trailing, 20)
                }
            }
            .frame(maxWidth: .infinity)
            .animation(.easeOut(duration: 0.1), value: translationDragOffset)
        }
    }

    /// Animate the current translation question card off-screen, then call
    /// the actual problem-change closure with the offset reset (no animation)
    /// so the next card pops in at the centre instead of sliding back.
    private func flyOffTranslation(direction: CGFloat, completion: @escaping () -> Void) {
        withAnimation(.easeOut(duration: 0.25)) {
            translationDragOffset = CGSize(
                width: direction * 700,
                height: translationDragOffset.height
            )
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            var t = Transaction()
            t.disablesAnimations = true
            withTransaction(t) {
                translationDragOffset = .zero
                completion()
            }
        }
    }

    private func nextProblem() {
        let queue = translationQueue
        guard !queue.isEmpty else { return }
        let pos = (currentQueuePosition(in: queue) + 1) % queue.count
        moveToProblem(queue[pos])
    }

    private func prevProblem() {
        let queue = translationQueue
        guard !queue.isEmpty else { return }
        let pos = (currentQueuePosition(in: queue) - 1 + queue.count) % queue.count
        moveToProblem(queue[pos])
    }

    private func moveToProblem(_ pair: (word: Word, exampleIdx: Int)) {
        guard pair.exampleIdx < pair.word.examples.count else { return }
        currentWord = pair.word
        currentExample = pair.word.examples[pair.exampleIdx]
        savedTranslationWordId = pair.word.id.uuidString
        savedTranslationExampleIdx = pair.exampleIdx
        showAnswer = false
    }

    /// Stable key per (current word, example slot index) used for storing
    /// AI grammar explanations and composition attempts in WordStore.studyLogs.
    private var studyLogKey: String? {
        guard let w = currentWord, let ex = currentExample,
              let idx = w.examples.firstIndex(where: { $0.id == ex.id }) else {
            return nil
        }
        return "\(w.id.uuidString)#\(idx)"
    }

    // MARK: - Review gauge

    private struct ReviewStage {
        let filled: Int
        let label: String
        let color: Color
        let isRainbow: Bool
    }

    private func reviewStage(forCount count: Int) -> ReviewStage {
        switch count {
        case 0:  return ReviewStage(filled: 0, label: "未学習",   color: .gray,   isRainbow: false)
        case 1:  return ReviewStage(filled: 1, label: "1回目",   color: .red,    isRainbow: false)
        case 2:  return ReviewStage(filled: 2, label: "復習中",   color: .yellow, isRainbow: false)
        case 3:  return ReviewStage(filled: 3, label: "3回目",   color: .cyan,   isRainbow: false)
        default: return ReviewStage(filled: 4, label: "復習完了", color: .purple, isRainbow: true)
        }
    }

    private func reviewGauge(for word: Word) -> some View {
        // Show the per-mode count so the gauge advances per quiz mode.
        let count = word.modeCounts[mode.modeKey] ?? 0
        let info = reviewStage(forCount: count)
        return HStack(spacing: 8) {
            HStack(spacing: 3) {
                ForEach(0..<4, id: \.self) { idx in
                    gaugeSegment(filled: idx < info.filled, isRainbow: info.isRainbow, solidColor: info.color)
                }
            }
            Text(info.label)
                .font(.caption2.bold())
                .foregroundStyle(info.color)
            Spacer()
            Text("復習 \(count) 回")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
    }

    @ViewBuilder
    private func gaugeSegment(filled: Bool, isRainbow: Bool, solidColor: Color) -> some View {
        if filled && isRainbow {
            Capsule()
                .fill(LinearGradient(
                    colors: [.red, .orange, .yellow, .green, .blue, .purple],
                    startPoint: .leading, endPoint: .trailing
                ))
                .frame(width: 22, height: 6)
        } else if filled {
            Capsule()
                .fill(solidColor)
                .frame(width: 22, height: 6)
        } else {
            Capsule()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 22, height: 6)
        }
    }

    /// Two self-rate buttons shown under the translation answer panel so
    /// the user can mark whether they got it right. The result feeds into
    /// the per-mode count for "translation".
    @ViewBuilder
    private func selfRateRow(for word: Word) -> some View {
        HStack(spacing: 10) {
            Button {
                store.recordModeAnswer(.forgot, for: word, modeKey: mode.modeKey)
                advanceTranslationAfterRating()
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "xmark.circle.fill")
                    Text("できなかった").bold()
                    Spacer()
                }
                .padding(.vertical, 12)
                .foregroundStyle(.red)
                .background(Color.red.opacity(0.10))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.red.opacity(0.4), lineWidth: 1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }

            Button {
                correctCount += 1
                store.recordModeAnswer(.perfect, for: word, modeKey: mode.modeKey)
                advanceTranslationAfterRating()
            } label: {
                HStack {
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                    Text("できた").bold()
                    Spacer()
                }
                .padding(.vertical, 12)
                .foregroundStyle(.white)
                .background(Color.indigo)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }

    /// Move to the next translation problem after a self-rating tap.
    private func advanceTranslationAfterRating() {
        nextProblem()
    }

    private func answerView(_ ex: ExampleSentence, word: Word) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Text("お手本の英訳").font(.caption).foregroundStyle(.tertiary)
                    Spacer()
                    Text("タップで単語カード")
                        .font(.caption2)
                        .foregroundStyle(.indigo.opacity(0.8))
                    Image(systemName: "info.circle.fill")
                        .font(.caption2)
                        .foregroundStyle(.indigo.opacity(0.8))
                }
                HStack(alignment: .top, spacing: 8) {
                    Button {
                        SpeechManager.shared.speak(ex.english)
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 11))
                            .foregroundStyle(.indigo)
                            .frame(width: 24, height: 24)
                            .background(Color.indigo.opacity(0.1))
                            .clipShape(Circle())
                    }
                    .buttonStyle(.plain)
                    // Tapping the sentence opens the card for the word it
                    // belongs to.
                    Button {
                        openDetail(for: word)
                    } label: {
                        Text(ex.english)
                            .font(.body)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                }
                Button {
                    openDetail(for: word)
                } label: {
                    Text(ex.japanese)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.plain)
            }

            Divider()

            VStack(alignment: .leading, spacing: 8) {
                Text("文法・語法の解説").font(.caption).foregroundStyle(.tertiary)
                if let grammar = ex.grammar?.trimmingCharacters(in: .whitespacesAndNewlines),
                   !grammar.isEmpty {
                    Text(grammar)
                        .font(.subheadline)
                        .foregroundStyle(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    Text("この例文には解説がまだ用意されていません。\n「新しい例文を生成」を押すと、文法解説付きの例文に差し替わります。")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.green.opacity(0.10)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.green.opacity(0.5), lineWidth: 1))
    }

    /// Restore the previously-shown problem, but only if it is part of
    /// today's Day — otherwise the day has rolled over and we start the new
    /// Day from its first sentence.
    private func loadSavedTranslationProblem() -> (word: Word, example: ExampleSentence)? {
        guard let id = UUID(uuidString: savedTranslationWordId),
              let word = store.words.first(where: { $0.id == id }),
              !word.examples.isEmpty else {
            return nil
        }
        let idx = max(0, min(savedTranslationExampleIdx, word.examples.count - 1))
        let isInToday = translationQueue.contains { $0.word.id == id && $0.exampleIdx == idx }
        guard isInToday else { return nil }
        return (word, word.examples[idx])
    }

    /// Start today's Day at its first sentence.
    private func pickFreshTranslationProblem() {
        guard let first = translationQueue.first else {
            currentWord = nil
            currentExample = nil
            return
        }
        moveToProblem(first)
        answered = false
    }

    // MARK: - AI assistance for translation mode

    @MainActor
    private func fetchAIGrammar() async {
        guard let ex = currentExample, let key = studyLogKey else { return }
        isFetchingGrammar = true
        defer { isFetchingGrammar = false }
        do {
            let text = try await GeminiService.explainGrammar(
                english: ex.english,
                japanese: ex.japanese
            )
            store.setAIGrammar(text, forKey: key)
        } catch {
            aiErrorMessage = error.localizedDescription
            showAIError = true
        }
    }

    @ViewBuilder
    private func aiAssistSection(for ex: ExampleSentence) -> some View {
        let key = studyLogKey ?? ""
        let log = store.studyLog(forKey: key)
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "sparkles").foregroundStyle(.indigo)
                Text("AI 文法・語法の解説")
                    .font(.subheadline.bold())
                Spacer()
                Button {
                    Task { await fetchAIGrammar() }
                } label: {
                    HStack(spacing: 4) {
                        if isFetchingGrammar {
                            ProgressView().scaleEffect(0.7)
                            Text("生成中…")
                        } else {
                            Image(systemName: log.aiGrammar == nil ? "wand.and.stars" : "arrow.clockwise")
                            Text(log.aiGrammar == nil ? "Geminiに解説させる" : "再生成")
                        }
                    }
                    .font(.caption.bold())
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(Capsule().fill(Color.indigo))
                }
                .buttonStyle(.plain)
                .disabled(isFetchingGrammar)
            }

            if let g = log.aiGrammar, !g.isEmpty {
                Text(g)
                    .font(.subheadline)
                    .foregroundStyle(.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else if !isFetchingGrammar {
                Text("ボタンを押すとGeminiが文法・語法・コロケーションを箇条書きで解説します。一度生成すると自動保存されて次回以降も表示されます。")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.indigo.opacity(0.08)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.indigo.opacity(0.4), lineWidth: 1))
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
                        if let ipa = word.ipa, !ipa.isEmpty {
                            Text(ipa)
                                .font(.system(size: 15, design: .serif))
                                .foregroundStyle(.indigo)
                        }
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
            let mapped = new.map { ExampleSentence(english: $0.english, japanese: $0.japanese, grammar: $0.grammar) }
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
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.7)))
    }
}

// MARK: - 単語復習 (swipe flashcards from the 復習リスト（会話頻度順） table)

/// Which language is shown on the front of the card.
enum WordReviewDirection: String, CaseIterable, Identifiable {
    case jaToEn = "日本語 → 英語"
    case enToJa = "英語 → 日本語"
    /// Alternates every card: 日→英, 英→日, 日→英 …
    case alternate = "交互"
    var id: String { rawValue }
}

/// The pool a 単語復習 session draws from. Chosen on the menu screen.
enum WordReviewSource: Hashable {
    case today
    case review
    case all(page: Int)

    var title: String {
        switch self {
        case .today: return "今日の単語"
        case .review: return "復習単語"
        case .all: return "全部の単語 \(rangeLabel)"
        }
    }

    /// "1〜500", "501〜1000", … for the 全部の単語 pages; empty otherwise.
    var rangeLabel: String {
        guard case .all(let page) = self else { return "" }
        let s = page * WordStore.wordReviewPageSize + 1
        let e = (page + 1) * WordStore.wordReviewPageSize
        return "\(s)〜\(e)"
    }
}

/// Entry point for 単語復習. Shows the menu first; picking an item starts a
/// session (the swipe cards), and finishing or backing out returns here.
struct WordReviewView: View {
    @EnvironmentObject var store: WordStore

    @AppStorage("wordReview.direction") private var directionRaw: String = WordReviewDirection.jaToEn.rawValue
    @State private var activeSource: WordReviewSource? = nil
    /// Snapshot of the words taken when the session started, so the list
    /// doesn't shift underneath the user (e.g. un-ticking a word on the
    /// summary screen of a 復習単語 session must not remove its row).
    @State private var sessionWords: [RankedWord] = []
    /// Bumped on every start so the session view's @State is rebuilt.
    @State private var sessionToken: Int = 0

    private var direction: WordReviewDirection {
        WordReviewDirection(rawValue: directionRaw) ?? .jaToEn
    }

    private var allWords: [RankedWord] { store.allWordReviewShuffled }
    private var pageCount: Int {
        max(1, (allWords.count + WordStore.wordReviewPageSize - 1) / WordStore.wordReviewPageSize)
    }

    private func words(for source: WordReviewSource) -> [RankedWord] {
        switch source {
        case .today:
            return store.todaysWordReview
        case .review:
            return store.wordReviewWords
        case .all(let page):
            let all = allWords
            let start = page * WordStore.wordReviewPageSize
            guard start < all.count else { return [] }
            return Array(all[start..<min(start + WordStore.wordReviewPageSize, all.count)])
        }
    }

    var body: some View {
        if let source = activeSource {
            WordReviewSessionView(
                title: source.title,
                words: sessionWords,
                direction: direction,
                onExit: { activeSource = nil }
            )
            .id(sessionToken)
            .environmentObject(store)
        } else {
            menu
        }
    }

    private func start(_ source: WordReviewSource) {
        sessionWords = words(for: source)
        sessionToken += 1
        activeSource = source
    }

    // MARK: Menu screen

    private var menu: some View {
        ScrollView {
            VStack(spacing: 14) {
                VStack(spacing: 4) {
                    Text("単語復習")
                        .font(.title3.bold())
                    Text("メニューを選んで学習を始めます")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                VStack(alignment: .leading, spacing: 6) {
                    Text("表示の向き")
                        .font(.caption.bold())
                        .foregroundStyle(.secondary)
                    Picker("表示の向き", selection: $directionRaw) {
                        ForEach(WordReviewDirection.allCases) { d in
                            Text(d.rawValue).tag(d.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.82)))

                menuRow(
                    icon: "sun.max.fill",
                    title: "今日の単語",
                    subtitle: "\(store.todaysWordReview.count)語・毎日ランダムに入れ替わります",
                    enabled: !store.todaysWordReview.isEmpty
                ) {
                    start(.today)
                }

                menuRow(
                    icon: "arrow.counterclockwise.circle.fill",
                    title: "復習単語",
                    subtitle: store.wordReviewWords.isEmpty
                        ? "❌にした単語がここに入ります（3日でリセット）"
                        : "\(store.wordReviewWords.count)語・❌にした単語（3日でリセット）",
                    enabled: !store.wordReviewWords.isEmpty
                ) {
                    start(.review)
                }

                Menu {
                    ForEach(0..<pageCount, id: \.self) { i in
                        Button(WordReviewSource.all(page: i).rangeLabel) {
                            start(.all(page: i))
                        }
                    }
                } label: {
                    menuRowLabel(
                        icon: "square.stack.3d.up.fill",
                        title: "全部の単語",
                        subtitle: "\(allWords.count)語・500語ずつ選択（順番は毎日ランダム）",
                        trailing: "chevron.down",
                        enabled: !allWords.isEmpty
                    )
                }
                .disabled(allWords.isEmpty)

                Spacer(minLength: 12)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
    }

    private func menuRow(icon: String, title: String, subtitle: String, enabled: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            menuRowLabel(icon: icon, title: title, subtitle: subtitle, trailing: "chevron.right", enabled: enabled)
        }
        .buttonStyle(.plain)
        .disabled(!enabled)
    }

    private func menuRowLabel(icon: String, title: String, subtitle: String, trailing: String, enabled: Bool) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundStyle(.indigo)
                .frame(width: 32)
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.primary)
                Text(subtitle)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
            Image(systemName: trailing)
                .font(.caption.bold())
                .foregroundStyle(.secondary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.82)))
        .opacity(enabled ? 1 : 0.45)
        .contentShape(Rectangle())
    }
}

/// One 単語復習 session: swipe through `words` one card at a time.
/// - tap the card → show / hide the translation
/// - swipe right → ⭕️ (知っている), next card
/// - swipe left  → ❌, the word goes straight into 復習単語, next card
/// When the last card is done, every word is listed with a tick that adds
/// it to / removes it from 復習単語.
struct WordReviewSessionView: View {
    let title: String
    let words: [RankedWord]
    let direction: WordReviewDirection
    let onExit: () -> Void

    @EnvironmentObject var store: WordStore

    @State private var index: Int = 0
    @State private var showAnswer: Bool = false
    /// RankedWord id → true (⭕️) / false (❌) for cards already swiped.
    @State private var results: [Int: Bool] = [:]
    @State private var dragOffset: CGSize = .zero
    @State private var isFlyingOff: Bool = false

    private var isFinished: Bool { index >= words.count }
    private var current: RankedWord? { isFinished ? nil : words[index] }

    /// English on the front for this card?
    private func englishFront(at i: Int) -> Bool {
        switch direction {
        case .jaToEn: return false
        case .enToJa: return true
        case .alternate: return i % 2 == 1
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            topBar
            if words.isEmpty {
                Spacer()
                Text("単語がありません")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
            } else if isFinished {
                summary
            } else if let w = current {
                Spacer(minLength: 8)
                card(w)
                    .padding(.horizontal, 20)
                Spacer(minLength: 8)
            }
        }
    }

    // MARK: Top bar — only a way back to the menu; no counters or hints here

    private var topBar: some View {
        HStack {
            Button {
                onExit()
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "chevron.left")
                    Text("メニュー")
                }
                .font(.subheadline)
                .foregroundStyle(.indigo)
            }
            .buttonStyle(.plain)
            Spacer()
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }

    // MARK: Card

    private func card(_ w: RankedWord) -> some View {
        let enFront = englishFront(at: index)
        let front = enFront ? w.english : w.japanese
        let back = enFront ? w.japanese : w.english
        return VStack(spacing: 14) {
            // Position, just above the word.
            Text("\(index + 1) / \(words.count)")
                .font(.caption.bold())
                .foregroundStyle(.secondary)

            Text(front)
                .font(.system(size: enFront ? 30 : 26, weight: .bold))
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.6)
                .lineLimit(3)
                .padding(.horizontal, 8)

            if showAnswer {
                Divider().padding(.horizontal, 24)
                HStack(spacing: 8) {
                    Text(back)
                        .font(.system(size: enFront ? 22 : 26, weight: .semibold))
                        .foregroundStyle(.indigo)
                        .multilineTextAlignment(.center)
                        .minimumScaleFactor(0.6)
                        .lineLimit(3)
                    Button {
                        SpeechManager.shared.speak(w.english)
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 16))
                            .foregroundStyle(.indigo)
                    }
                    .buttonStyle(.plain)
                }
                if !w.gloss.isEmpty {
                    Text(w.gloss)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 12)
                }
                Text(w.stars)
                    .font(.caption)
                    .foregroundStyle(.orange)
            } else {
                HStack(spacing: 6) {
                    Image(systemName: "hand.tap")
                    Text("タップで答えを表示")
                }
                .font(.caption2.bold())
                .foregroundStyle(.indigo.opacity(0.8))
                .padding(.top, 4)
            }
        }
        .padding(.vertical, 28)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity)
        .frame(minHeight: 260)
        .background(RoundedRectangle(cornerRadius: 18).fill(Color.white.opacity(0.9)))
        .overlay(swipeHint.allowsHitTesting(false))
        .offset(x: dragOffset.width, y: dragOffset.height)
        .rotationEffect(.degrees(Double(dragOffset.width) / 22))
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.18)) {
                showAnswer.toggle()
            }
        }
        .gesture(swipeGesture)
    }

    /// ⭕️ / ❌ fades in on the card as it is dragged, so the direction is
    /// unmistakable while the finger is still down.
    @ViewBuilder
    private var swipeHint: some View {
        let progress = min(abs(dragOffset.width) / 60, 1.0)
        if progress > 0.05 {
            let isRight = dragOffset.width > 0
            VStack {
                HStack {
                    if isRight { Spacer() }
                    Text(isRight ? "⭕️" : "❌")
                        .font(.system(size: 44))
                        .opacity(Double(progress))
                        .padding(16)
                    if !isRight { Spacer() }
                }
                Spacer()
            }
            .animation(.easeOut(duration: 0.1), value: dragOffset)
        }
    }

    /// The card follows the finger freely in every direction; only the
    /// horizontal distance at release decides ⭕️ (right) / ❌ (left).
    private var swipeGesture: some Gesture {
        DragGesture(minimumDistance: 10)
            .onChanged { value in
                guard !isFlyingOff else { return }
                dragOffset = value.translation
            }
            .onEnded { value in
                guard !isFlyingOff else { return }
                let threshold: CGFloat = 60
                if value.translation.width > threshold {
                    flyOff(direction: 1) { mark(known: true) }
                } else if value.translation.width < -threshold {
                    flyOff(direction: -1) { mark(known: false) }
                } else {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                        dragOffset = .zero
                    }
                }
            }
    }

    private func flyOff(direction: CGFloat, completion: @escaping () -> Void) {
        isFlyingOff = true
        withAnimation(.easeOut(duration: 0.22)) {
            dragOffset = CGSize(width: direction * 700, height: dragOffset.height)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
            var t = Transaction()
            t.disablesAnimations = true
            withTransaction(t) {
                dragOffset = .zero
                completion()
                isFlyingOff = false
            }
        }
    }

    private func mark(known: Bool) {
        guard let w = current else { return }
        results[w.id] = known
        if !known {
            // ❌ goes straight into 復習単語.
            store.addToWordReview(w.id)
        }
        showAnswer = false
        index += 1
    }

    // MARK: Summary — every word with a tick for 復習単語

    private var knownCount: Int { results.values.filter { $0 }.count }
    private var unknownCount: Int { results.values.filter { !$0 }.count }

    private var summary: some View {
        VStack(spacing: 0) {
            VStack(spacing: 6) {
                Text("終了！")
                    .font(.title3.bold())
                HStack(spacing: 16) {
                    Text("⭕️ \(knownCount)")
                    Text("❌ \(unknownCount)")
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                Text("チェックを入れた単語が復習単語に入ります")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }
            .padding(.vertical, 10)

            ScrollView {
                LazyVStack(spacing: 0) {
                    ForEach(words) { w in
                        summaryRow(w)
                        Divider().opacity(0.4)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.85)))
                .padding(.horizontal, 16)
            }

            HStack(spacing: 12) {
                Button {
                    restart()
                } label: {
                    Label("もう一度", systemImage: "arrow.counterclockwise")
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Capsule().fill(Color.white.opacity(0.85)))
                        .foregroundStyle(.indigo)
                }
                .buttonStyle(.plain)
                Button {
                    onExit()
                } label: {
                    Label("メニューへ", systemImage: "list.bullet")
                        .font(.subheadline.bold())
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Capsule().fill(Color.indigo))
                        .foregroundStyle(.white)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
    }

    private func summaryRow(_ w: RankedWord) -> some View {
        let inReview = store.isInWordReview(w.id)
        let result = results[w.id]
        return HStack(spacing: 8) {
            Button {
                store.toggleWordReview(w.id)
            } label: {
                Image(systemName: inReview ? "checkmark.square.fill" : "square")
                    .font(.system(size: 20))
                    .foregroundStyle(inReview ? .indigo : .secondary)
                    .frame(width: 28)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            Text(w.japanese)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(w.english)
                .fontWeight(.semibold)
                .foregroundStyle(.indigo)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: 130, alignment: .leading)
            Text(result.map { $0 ? "⭕️" : "❌" } ?? "")
                .frame(width: 24)
        }
        .font(.system(size: 13))
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(inReview ? Color.yellow.opacity(0.35) : Color.clear)
    }

    private func restart() {
        index = 0
        results = [:]
        showAnswer = false
        dragOffset = .zero
    }
}

#Preview {
    QuizView(activeTab: .constant(.quiz))
        .environmentObject(WordStore())
}
