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

    private var queue: [Word] {
        let base: [Word]
        switch filter {
        case .dueToday:   base = store.dueWords
        case .reviewList: base = store.reviewListWords
        case .all:        base = store.words
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
                        .offset(x: dragOffset.width, y: 0)
                        .rotationEffect(.degrees(Double(dragOffset.width) / 20))
                        .gesture(swipeGesture(for: word))
                        .animation(.spring(response: 0.35, dampingFraction: 0.75), value: dragOffset)
                        .transition(.opacity)
                } else {
                    completedView
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .alert("進捗をリセットしますか？", isPresented: $showResetAlert) {
            Button("キャンセル", role: .cancel) {}
            Button("リセット", role: .destructive) {
                store.resetAllProgress()
                indexInQueue = 0
            }
        } message: {
            Text("全単語の復習回数とステータスが初期化されます。")
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
                    sectionTitle("例文")
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
                    .fill(Color(.secondarySystemGroupedBackground))
                    .shadow(color: .black.opacity(0.06), radius: 8, x: 0, y: 2)
            )
            .padding(.horizontal, 12)
            .padding(.top, 4)
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
            RoundedRectangle(cornerRadius: 12).fill(Color(.tertiarySystemGroupedBackground))
        )
    }

    // MARK: - Swipe gesture

    private func swipeGesture(for word: Word) -> some Gesture {
        DragGesture(minimumDistance: 10)
            .onChanged { value in
                dragOffset = value.translation
            }
            .onEnded { value in
                let threshold: CGFloat = 100
                if value.translation.width > threshold {
                    recordMark(.perfect)
                } else if value.translation.width < -threshold {
                    recordMark(.forgot)
                } else {
                    dragOffset = .zero
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
    ReviewView(activeTab: .constant(.card))
        .environmentObject(WordStore())
}
