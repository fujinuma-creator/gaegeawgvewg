import SwiftUI

// MARK: - Card-based Review (matches HTML mockup)

struct ReviewView: View {
    @EnvironmentObject var store: WordStore
    @Binding var activeTab: ContentView.Tab

    enum ReviewFilter: String, CaseIterable, Identifiable {
        case dueToday = "本日"
        case reviewList = "復習リスト"
        case all = "すべて"
        var id: String { rawValue }
    }

    @State private var filter: ReviewFilter = .dueToday
    @State private var shuffled: Bool = false
    @State private var indexInQueue: Int = 0
    @State private var dragOffset: CGSize = .zero
    @State private var showResetAlert: Bool = false
    @State private var regeneratingExamplesForId: UUID? = nil
    @State private var regenerateError: String? = nil
    @State private var showRegenerateError: Bool = false

    private var queue: [Word] {
        let base: [Word]
        switch filter {
        case .dueToday:   base = store.dueWords
        case .reviewList: base = store.reviewListWords   // already daily-shuffled
        case .all:        base = store.words.dailyShuffled()
        }
        return shuffled ? base.shuffled() : base
    }

    private var currentWord: Word? {
        guard !queue.isEmpty, indexInQueue < queue.count else { return nil }
        return queue[indexInQueue]
    }

    var body: some View {
        VStack(spacing: 0) {
            header
            controlsRow
            swipeHints
            ZStack {
                if let word = currentWord {
                    cardView(for: word)
                        .id(word.id)
                        .transition(.opacity.combined(with: .scale(scale: 0.96)))
                } else {
                    completedView
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(GeometricBackground().ignoresSafeArea())
        .alert("進捗をリセットしますか？", isPresented: $showResetAlert) {
            Button("キャンセル", role: .cancel) {}
            Button("リセット", role: .destructive) {
                store.resetAllProgress()
                indexInQueue = 0
            }
        } message: {
            Text("全単語の復習回数とステータスが初期化されます。")
        }
        .alert("例文の生成に失敗しました", isPresented: $showRegenerateError, presenting: regenerateError) { _ in
            Button("OK", role: .cancel) {}
        } message: { msg in
            Text(msg)
        }
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: 8) {
            HStack {
                Text("英単語の復習")
                    .font(.title2.bold())
                Spacer()
                Button("リセット") { showResetAlert = true }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            HStack(spacing: 6) {
                Text("\(store.perfectCount)")
                Text("◎").foregroundStyle(.indigo)
                Text("·")
                Text("\(store.fuzzyCount)").foregroundStyle(.orange)
                Text("△").foregroundStyle(.orange)
                Text("/ \(store.totalCount)")
                Spacer()
                Text("\(Int(store.progressFraction * 100))%")
                    .foregroundStyle(.secondary)
            }
            .font(.subheadline)

            ProgressView(value: store.progressFraction)
                .progressViewStyle(.linear)
                .tint(.indigo)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    // MARK: - Controls (counter + audio/shuffle/filter)

    private var controlsRow: some View {
        HStack {
            Text("\(min(indexInQueue + 1, max(queue.count, 1))) / \(queue.count)")
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Spacer()
            HStack(spacing: 8) {
                circleIconButton(systemName: "speaker.wave.2") {
                    if let w = currentWord { SpeechManager.shared.speak(w.word) }
                }
                circleIconButton(systemName: shuffled ? "shuffle.circle.fill" : "shuffle") {
                    shuffled.toggle()
                    indexInQueue = 0
                }
                Menu {
                    ForEach(ReviewFilter.allCases) { f in
                        Button {
                            filter = f
                            indexInQueue = 0
                        } label: {
                            if filter == f {
                                Label(f.rawValue, systemImage: "checkmark")
                            } else {
                                Text(f.rawValue)
                            }
                        }
                    }
                } label: {
                    circleIconLabel(systemName: "line.3.horizontal.decrease")
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    private var swipeHints: some View {
        HStack {
            Text("← 左スワイプ：× わからない")
                .foregroundStyle(.red.opacity(0.85))
            Spacer()
            Text("◎ 完璧：右スワイプ →")
                .foregroundStyle(.indigo.opacity(0.85))
        }
        .font(.caption)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }

    // MARK: - Card

    @ViewBuilder
    private func cardView(for word: Word) -> some View {
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
                    statusBadge(for: word)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(word.word)
                        .font(.system(size: 32, weight: .bold))
                    if let ipa = word.ipa, !ipa.isEmpty {
                        Text(ipa)
                            .font(.system(size: 15, design: .serif))
                            .foregroundStyle(.indigo)
                    }
                    Text(word.definitionJapanese)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }

                Divider()

                sectionTitle("英語の定義")
                HStack(alignment: .top, spacing: 8) {
                    smallSpeakerButton(text: word.definitionEnglish)
                    Text(word.definitionEnglish)
                        .italic()
                        .foregroundStyle(.primary)
                }

                if !word.useCases.isEmpty {
                    sectionTitle("使う場面")
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(word.useCases, id: \.self) { uc in
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Circle()
                                    .fill(Color.indigo)
                                    .frame(width: 5, height: 5)
                                Text(uc)
                            }
                        }
                    }
                }

                if !word.examples.isEmpty {
                    HStack {
                        sectionTitle("例文")
                        Spacer()
                        regenerateExamplesButton(for: word)
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
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white.opacity(0.82))
                    .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, 12)
            .padding(.top, 4)
            .offset(x: dragOffset.width, y: dragOffset.height * 0.4)
            .rotationEffect(.degrees(Double(dragOffset.width) / 18))
            .overlay(swipeHintOverlay.allowsHitTesting(false))
            .contentShape(Rectangle())
            .gesture(globalSwipeGesture)
        }
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
                Text("英語の定義").font(.caption).foregroundStyle(.tertiary)
                HStack(alignment: .top, spacing: 8) {
                    smallSpeakerButton(text: syn.definitionEnglish)
                    Text(syn.definitionEnglish).italic()
                }
            }
            if !syn.useCases.isEmpty {
                Text("使う場面").font(.caption).foregroundStyle(.tertiary)
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(syn.useCases, id: \.self) { uc in
                        HStack(alignment: .firstTextBaseline, spacing: 8) {
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
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.7))
        )
    }

    // MARK: - Swipe gesture

    /// Per-word gesture (kept for the cardView call site if needed).
    private func swipeGesture(for word: Word) -> some Gesture {
        globalSwipeGesture
    }

    /// Drag gesture attached to the whole card area (not just the card itself)
    /// so the user can swipe from anywhere on screen. Uses a low minimum
    /// distance so the gesture fires immediately, and a relaxed threshold so
    /// shorter swipes commit. Holding past the threshold without releasing
    /// keeps the card pinned to the side until the user lets go.
    private var globalSwipeGesture: some Gesture {
        DragGesture(minimumDistance: 2)
            .onChanged { value in
                dragOffset = value.translation
            }
            .onEnded { value in
                let threshold: CGFloat = 60
                if value.translation.width > threshold {
                    flyOff(direction: 1) {
                        recordMark(.perfect)
                    }
                } else if value.translation.width < -threshold {
                    // Left swipe: also auto-pin the word to the review list
                    // (no-op if already there) so the user can quickly send
                    // weak words into focused practice.
                    flyOff(direction: -1) {
                        if let w = currentWord, !w.isInReviewList {
                            store.toggleReviewList(for: w)
                        }
                        recordMark(.forgot)
                    }
                } else {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                        dragOffset = .zero
                    }
                }
            }
    }

    /// Big colored stamp that appears as the user drags the card.
    /// Provides visual feedback so the user can tell when their hold has
    /// crossed the swipe threshold without releasing.
    @ViewBuilder
    private var swipeHintOverlay: some View {
        let progress = min(abs(dragOffset.width) / 60, 1.0)
        let isRight = dragOffset.width > 0

        if progress > 0.05 {
            ZStack {
                if isRight {
                    Text("◎")
                        .font(.system(size: 110, weight: .black))
                        .foregroundStyle(.green.opacity(0.8 * progress))
                        .rotationEffect(.degrees(-15))
                        .offset(x: -50, y: -120)
                        .shadow(color: .green.opacity(0.4 * progress), radius: 8)
                } else {
                    Text("×")
                        .font(.system(size: 130, weight: .black))
                        .foregroundStyle(.red.opacity(0.8 * progress))
                        .rotationEffect(.degrees(15))
                        .offset(x: 50, y: -120)
                        .shadow(color: .red.opacity(0.4 * progress), radius: 8)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .animation(.easeOut(duration: 0.1), value: dragOffset)
        }
    }

    /// Tinder-style fly-off animation: animate the card past the screen edge,
    /// then snap dragOffset back to zero (without animation) so the next card
    /// — keyed by the new word's id — appears at center instead of sliding
    /// back from the off-screen position.
    private func flyOff(direction: CGFloat, completion: @escaping () -> Void) {
        withAnimation(.easeOut(duration: 0.25)) {
            dragOffset = CGSize(width: direction * 700, height: dragOffset.height)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            var t = Transaction()
            t.disablesAnimations = true
            withTransaction(t) {
                dragOffset = .zero
                completion()
            }
        }
    }

    private func recordMark(_ m: ReviewMark) {
        guard let word = currentWord else { return }
        store.record(mark: m, for: word)
        dragOffset = .zero
        // Move to next word in queue. Since the queue is computed from store,
        // the answered word is removed from "due" automatically, so keep index.
        if filter == .dueToday {
            // Don't increment because the just-answered word leaves the queue,
            // shifting the next word into the same index.
        } else {
            indexInQueue += 1
        }
        if indexInQueue >= queue.count { indexInQueue = max(0, queue.count - 1) }
    }

    // MARK: - Helpers

    private func statusBadge(for word: Word) -> some View {
        Text(word.status.label)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                Capsule().fill(badgeColor(for: word.status).opacity(0.15))
            )
            .foregroundStyle(badgeColor(for: word.status))
    }

    private func badgeColor(for s: WordStatus) -> Color {
        switch s {
        case .unlearned: return .gray
        case .fuzzy:     return .orange
        case .perfect:   return .indigo
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

    @ViewBuilder
    private func regenerateExamplesButton(for word: Word) -> some View {
        Button {
            Task { await regenerateExamples(for: word) }
        } label: {
            HStack(spacing: 4) {
                if regeneratingExamplesForId == word.id {
                    ProgressView()
                        .scaleEffect(0.7)
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
        .disabled(regeneratingExamplesForId != nil)
    }

    @MainActor
    private func regenerateExamples(for word: Word) async {
        regeneratingExamplesForId = word.id
        defer { regeneratingExamplesForId = nil }
        do {
            let new = try await GeminiService.regenerateExamples(for: word)
            let mapped = new.map { ExampleSentence(english: $0.english, japanese: $0.japanese, grammar: $0.grammar) }
            store.updateExamples(for: word.id, with: mapped)
        } catch {
            regenerateError = error.localizedDescription
            showRegenerateError = true
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

    private func circleIconButton(systemName: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            circleIconLabel(systemName: systemName)
        }
    }

    private func circleIconLabel(systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.system(size: 14))
            .foregroundStyle(.secondary)
            .frame(width: 36, height: 36)
            .background(Color(.systemBackground))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(.separator), lineWidth: 0.5))
    }

    private var completedView: some View {
        VStack(spacing: 12) {
            Image(systemName: filter == .reviewList ? "star" : "checkmark.seal.fill")
                .font(.system(size: 56))
                .foregroundStyle(filter == .reviewList ? .indigo : .green)
            Text(emptyTitle)
                .font(.title3.bold())
                .multilineTextAlignment(.center)
            Text(emptyMessage)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
        .padding()
    }

    private var emptyTitle: String {
        switch filter {
        case .dueToday:   return "本日の復習は完了！"
        case .reviewList: return "復習リストは空です"
        case .all:        return "単語がありません"
        }
    }

    private var emptyMessage: String {
        switch filter {
        case .dueToday:
            if let next = store.words.map(\.nextReviewDate).filter({ $0 > Date() }).min() {
                return "次回: \(next.formatted(date: .abbreviated, time: .omitted))"
            }
            return "次の復習予定までゆっくり休みましょう。"
        case .reviewList:
            return "「一覧」や「クイズ」のチェック欄から追加できます\n（追加から1週間で自動的に消えます）"
        case .all:
            return "「一覧」タブから追加してください。"
        }
    }
}

#Preview {
    ReviewView(activeTab: .constant(.list))
        .environmentObject(WordStore())
}
