import SwiftUI

/// Grammar lesson list. Each topic expands into:
/// - 解説 (pre-written Japanese explanation)
/// - 英作文問題 (Gemini-generated J→E translation problem with AI grading + history)
/// - 選択問題 (Gemini-generated 4-choice grammar MCQ with explanation)
///
/// All generated problems and user attempts are persisted via `WordStore.grammarStates`.
struct GrammarView: View {
    @EnvironmentObject var store: WordStore

    @State private var expandedTopicId: String? = nil
    @State private var aiErrorMessage: String? = nil
    @State private var showAIError: Bool = false

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(GrammarTopicSeed.topics) { topic in
                    GrammarTopicCard(
                        topic: topic,
                        isExpanded: expandedTopicId == topic.id,
                        onToggle: {
                            if expandedTopicId == topic.id {
                                expandedTopicId = nil
                            } else {
                                expandedTopicId = topic.id
                            }
                        },
                        onAIError: { message in
                            aiErrorMessage = message
                            showAIError = true
                        }
                    )
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
        }
        .alert("AI 呼び出しに失敗しました", isPresented: $showAIError, presenting: aiErrorMessage) { _ in
            Button("OK", role: .cancel) {}
        } message: { msg in
            Text(msg)
        }
    }
}

// MARK: - Topic card

private struct GrammarTopicCard: View {
    @EnvironmentObject var store: WordStore
    let topic: GrammarTopic
    let isExpanded: Bool
    let onToggle: () -> Void
    let onAIError: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: onToggle) {
                HStack(alignment: .center, spacing: 10) {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(topic.title)
                            .font(.headline)
                            .foregroundStyle(.primary)
                        Text(topic.summary)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
                .padding(14)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            if isExpanded {
                VStack(alignment: .leading, spacing: 14) {
                    Divider()
                    explanationSection
                    translationSection
                    mcqSection
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.82))
        )
    }

    // MARK: Explanation

    private var explanationSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            sectionHeader(icon: "book.fill", title: "解説", color: .indigo)
            Text(topic.explanation)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.indigo.opacity(0.08)))
    }

    // MARK: Translation problem

    @State private var userTranslation: String = ""
    @State private var isGeneratingTranslation: Bool = false
    @State private var isCorrectingTranslation: Bool = false
    @State private var showTranslationAnswer: Bool = false
    @State private var latestAttempt: CompositionAttempt? = nil
    @State private var showHistory: Bool = false

    private var translationSection: some View {
        let state = store.grammarState(forTopic: topic.id)
        return VStack(alignment: .leading, spacing: 10) {
            sectionHeader(icon: "pencil.and.outline", title: "英作文問題", color: .purple)

            if let problem = state.translation {
                VStack(alignment: .leading, spacing: 8) {
                    Text("日本語")
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                    Text(problem.japanese)
                        .font(.subheadline.weight(.medium))
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.7)))

                    if let hint = problem.hint, !hint.isEmpty {
                        HStack(alignment: .top, spacing: 6) {
                            Image(systemName: "lightbulb.fill")
                                .foregroundStyle(.orange)
                            Text(hint)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }

                    Text("あなたの英訳").font(.caption).foregroundStyle(.tertiary)
                    TextEditor(text: $userTranslation)
                        .frame(minHeight: 80)
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.82)))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(.separator), lineWidth: 0.5))
                        .textInputAutocapitalization(.sentences)

                    HStack(spacing: 8) {
                        Button {
                            Task { await correctTranslation(problem: problem) }
                        } label: {
                            HStack {
                                if isCorrectingTranslation {
                                    ProgressView().scaleEffect(0.7)
                                    Text("添削中…")
                                } else {
                                    Image(systemName: "sparkles")
                                    Text("AIに添削").bold()
                                }
                            }
                            .font(.caption)
                            .padding(.horizontal, 12).padding(.vertical, 8)
                            .foregroundStyle(.white)
                            .background(Color.purple)
                            .clipShape(Capsule())
                            .opacity(canSubmitTranslation ? 1 : 0.5)
                        }
                        .disabled(!canSubmitTranslation)

                        Button {
                            withAnimation { showTranslationAnswer.toggle() }
                        } label: {
                            HStack {
                                Image(systemName: showTranslationAnswer ? "eye.slash" : "eye")
                                Text(showTranslationAnswer ? "答えを隠す" : "答えを見る")
                            }
                            .font(.caption.bold())
                            .padding(.horizontal, 12).padding(.vertical, 8)
                            .foregroundStyle(.indigo)
                            .background(Capsule().fill(Color.indigo.opacity(0.12)))
                        }
                        .buttonStyle(.plain)

                        Button {
                            Task { await regenerateTranslation() }
                        } label: {
                            HStack {
                                if isGeneratingTranslation {
                                    ProgressView().scaleEffect(0.7)
                                    Text("生成中…")
                                } else {
                                    Image(systemName: "arrow.clockwise")
                                    Text("新しい問題")
                                }
                            }
                            .font(.caption.bold())
                            .padding(.horizontal, 12).padding(.vertical, 8)
                            .foregroundStyle(.indigo)
                            .background(Capsule().fill(Color.indigo.opacity(0.12)))
                        }
                        .buttonStyle(.plain)
                        .disabled(isGeneratingTranslation)
                    }

                    if showTranslationAnswer {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("お手本の英訳").font(.caption).foregroundStyle(.tertiary)
                            HStack(alignment: .top, spacing: 8) {
                                Button {
                                    SpeechManager.shared.speak(problem.modelEnglish)
                                } label: {
                                    Image(systemName: "speaker.wave.2.fill")
                                        .font(.system(size: 11))
                                        .foregroundStyle(.indigo)
                                        .frame(width: 22, height: 22)
                                        .background(Color.indigo.opacity(0.1))
                                        .clipShape(Circle())
                                }
                                .buttonStyle(.plain)
                                Text(problem.modelEnglish).font(.subheadline)
                            }
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.10)))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.green.opacity(0.4), lineWidth: 1))
                    }

                    if let attempt = latestAttempt {
                        feedbackCard(attempt, isLatest: true)
                    }

                    let pastAttempts = state.translationAttempts.filter { $0.id != latestAttempt?.id }
                    if !pastAttempts.isEmpty {
                        Button {
                            withAnimation { showHistory.toggle() }
                        } label: {
                            HStack {
                                Image(systemName: "clock.arrow.circlepath")
                                Text("過去の添削履歴 (\(pastAttempts.count))")
                                    .font(.caption.bold())
                                Spacer()
                                Image(systemName: showHistory ? "chevron.up" : "chevron.down")
                            }
                            .foregroundStyle(.purple)
                            .padding(.horizontal, 10).padding(.vertical, 6)
                            .background(Capsule().fill(Color.purple.opacity(0.10)))
                        }
                        .buttonStyle(.plain)

                        if showHistory {
                            VStack(spacing: 6) {
                                ForEach(pastAttempts) { att in
                                    feedbackCard(att, isLatest: false)
                                }
                            }
                        }
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text("まだ問題が用意されていません。下のボタンを押すとGeminiがこのトピックの和文英訳問題を出題します。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Button {
                        Task { await regenerateTranslation() }
                    } label: {
                        HStack {
                            if isGeneratingTranslation {
                                ProgressView().scaleEffect(0.7)
                                Text("生成中…")
                            } else {
                                Image(systemName: "wand.and.stars")
                                Text("Geminiで問題を作る").bold()
                            }
                        }
                        .font(.caption)
                        .padding(.horizontal, 14).padding(.vertical, 8)
                        .foregroundStyle(.white)
                        .background(Capsule().fill(Color.purple))
                    }
                    .buttonStyle(.plain)
                    .disabled(isGeneratingTranslation)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple.opacity(0.06)))
    }

    private var canSubmitTranslation: Bool {
        !userTranslation.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !isCorrectingTranslation
    }

    @MainActor
    private func regenerateTranslation() async {
        isGeneratingTranslation = true
        defer { isGeneratingTranslation = false }
        do {
            let problem = try await GeminiService.generateGrammarTranslationProblem(
                topicTitle: topic.title,
                topicSummary: topic.summary,
                explanation: topic.explanation
            )
            store.setGrammarTranslation(problem, forTopic: topic.id)
            userTranslation = ""
            showTranslationAnswer = false
            latestAttempt = nil
        } catch {
            onAIError(error.localizedDescription)
        }
    }

    @MainActor
    private func correctTranslation(problem: GrammarTranslationProblem) async {
        let trimmed = userTranslation.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        isCorrectingTranslation = true
        defer { isCorrectingTranslation = false }
        do {
            let feedback = try await GeminiService.correctComposition(
                userEnglish: trimmed,
                targetJapanese: problem.japanese,
                referenceEnglish: problem.modelEnglish
            )
            store.appendGrammarTranslationAttempt(
                userText: trimmed,
                feedback: feedback,
                forTopic: topic.id
            )
            if let saved = store.grammarState(forTopic: topic.id).translationAttempts.first {
                latestAttempt = saved
            }
            showTranslationAnswer = true
        } catch {
            onAIError(error.localizedDescription)
        }
    }

    @ViewBuilder
    private func feedbackCard(_ attempt: CompositionAttempt, isLatest: Bool) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Image(systemName: "pencil.and.outline").foregroundStyle(.purple)
                Text(isLatest ? "AI 添削結果" : attempt.date.formatted(date: .abbreviated, time: .shortened))
                    .font(.caption.bold())
                    .foregroundStyle(.purple)
                Spacer()
                if !isLatest {
                    Button(role: .destructive) {
                        store.deleteGrammarTranslationAttempt(id: attempt.id, forTopic: topic.id)
                    } label: {
                        Image(systemName: "trash").font(.caption2).foregroundStyle(.red.opacity(0.7))
                    }
                    .buttonStyle(.plain)
                }
            }
            Text("あなたの英訳:").font(.caption2).foregroundStyle(.tertiary)
            Text(attempt.userText)
                .font(.subheadline)
                .padding(6)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.7)))
            Text(attempt.feedback)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.purple.opacity(0.10)))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.purple.opacity(0.35), lineWidth: 1))
    }

    // MARK: MCQ

    @State private var isGeneratingMCQ: Bool = false
    @State private var mcqRevealedExplanation: Bool = false

    private var mcqSection: some View {
        let state = store.grammarState(forTopic: topic.id)
        return VStack(alignment: .leading, spacing: 10) {
            sectionHeader(icon: "checkmark.circle.fill", title: "選択問題 (難)", color: .blue)

            if let problem = state.mcq {
                VStack(alignment: .leading, spacing: 8) {
                    Text(problem.question)
                        .font(.subheadline.weight(.medium))
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.7)))

                    VStack(spacing: 6) {
                        ForEach(problem.options) { opt in
                            mcqOptionButton(opt, problem: problem, state: state)
                        }
                    }

                    if state.mcqLastSelectedOptionId != nil {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Image(systemName: "lightbulb.fill").foregroundStyle(.blue)
                                Text("Gemini の解説").font(.caption.bold()).foregroundStyle(.blue)
                            }
                            Text(problem.explanation)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(10)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.blue.opacity(0.10)))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue.opacity(0.4), lineWidth: 1))
                    }

                    HStack {
                        Button {
                            Task { await regenerateMCQ() }
                        } label: {
                            HStack {
                                if isGeneratingMCQ {
                                    ProgressView().scaleEffect(0.7)
                                    Text("生成中…")
                                } else {
                                    Image(systemName: "arrow.clockwise")
                                    Text("新しい問題")
                                }
                            }
                            .font(.caption.bold())
                            .padding(.horizontal, 12).padding(.vertical, 8)
                            .foregroundStyle(.indigo)
                            .background(Capsule().fill(Color.indigo.opacity(0.12)))
                        }
                        .buttonStyle(.plain)
                        .disabled(isGeneratingMCQ)
                        Spacer()
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    Text("まだ問題が用意されていません。下のボタンを押すとGeminiが難しめの4択問題と詳しい解説を出題します。")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    Button {
                        Task { await regenerateMCQ() }
                    } label: {
                        HStack {
                            if isGeneratingMCQ {
                                ProgressView().scaleEffect(0.7)
                                Text("生成中…")
                            } else {
                                Image(systemName: "wand.and.stars")
                                Text("Geminiで問題を作る").bold()
                            }
                        }
                        .font(.caption)
                        .padding(.horizontal, 14).padding(.vertical, 8)
                        .foregroundStyle(.white)
                        .background(Capsule().fill(Color.blue))
                    }
                    .buttonStyle(.plain)
                    .disabled(isGeneratingMCQ)
                }
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.blue.opacity(0.06)))
    }

    @ViewBuilder
    private func mcqOptionButton(
        _ opt: GrammarMCQOption,
        problem: GrammarMultipleChoiceProblem,
        state: GrammarTopicState
    ) -> some View {
        let answered = state.mcqLastSelectedOptionId != nil
        let isCorrect = opt.id == problem.correctOptionId
        let isSelected = state.mcqLastSelectedOptionId == opt.id
        let bg: Color = {
            guard answered else { return Color.white.opacity(0.82) }
            if isCorrect { return Color.green.opacity(0.2) }
            if isSelected && !isCorrect { return Color.red.opacity(0.2) }
            return Color.white.opacity(0.82)
        }()
        let stroke: Color = {
            guard answered else { return Color(.separator) }
            if isCorrect { return Color.green }
            if isSelected && !isCorrect { return Color.red }
            return Color(.separator)
        }()

        Button {
            guard state.mcqLastSelectedOptionId == nil else { return }
            store.setGrammarMCQSelection(opt.id, forTopic: topic.id)
        } label: {
            HStack {
                Text(opt.text)
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

    @MainActor
    private func regenerateMCQ() async {
        isGeneratingMCQ = true
        defer { isGeneratingMCQ = false }
        do {
            let problem = try await GeminiService.generateGrammarMCQ(
                topicTitle: topic.title,
                topicSummary: topic.summary,
                explanation: topic.explanation
            )
            store.setGrammarMCQ(problem, forTopic: topic.id)
        } catch {
            onAIError(error.localizedDescription)
        }
    }

    // MARK: Helpers

    private func sectionHeader(icon: String, title: String, color: Color) -> some View {
        HStack(spacing: 6) {
            Image(systemName: icon).foregroundStyle(color)
            Text(title).font(.caption.bold()).foregroundStyle(color)
        }
    }
}

#Preview {
    GrammarView()
        .environmentObject(WordStore())
}
