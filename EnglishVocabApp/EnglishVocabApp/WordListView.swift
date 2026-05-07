import SwiftUI

/// Filter applied by `WordListContent`. `.all` shows every word with the
/// daily-shuffled ordering; `.reviewList` shows only pinned words sorted
/// by most-recently pinned.
enum WordListFilter: String, Identifiable {
    case all
    case reviewList
    var id: String { rawValue }
}

struct WordListView: View {
    @EnvironmentObject var store: WordStore
    @Binding var activeTab: ContentView.Tab

    enum Section: String, CaseIterable, Identifiable {
        case list = "一覧"
        case grammar = "文法"
        case shadowing = "シャドウイング"
        var id: String { rawValue }
    }

    @State private var section: Section = .list
    @State private var showAddSheet = false

    var body: some View {
        VStack(spacing: 0) {
            sectionPicker
            switch section {
            case .list:
                WordListContent(filter: .all, resetTrigger: activeTab)
            case .grammar:
                GrammarView()
            case .shadowing:
                ShadowingListView()
            }
        }
        .background(GeometricBackground().ignoresSafeArea())
        .overlay(alignment: .bottomTrailing) {
            if section == .list {
                Button {
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                        .font(.title2.bold())
                        .foregroundStyle(.white)
                        .frame(width: 56, height: 56)
                        .background(Color.indigo)
                        .clipShape(Circle())
                        .shadow(color: .black.opacity(0.2), radius: 6, y: 3)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 20)
            }
        }
        .sheet(isPresented: $showAddSheet) {
            AddWordView()
                .environmentObject(store)
        }
        .onChange(of: activeTab) { _, newValue in
            if newValue != .list {
                showAddSheet = false
            }
        }
    }

    private var sectionPicker: some View {
        Picker("表示", selection: $section) {
            ForEach(Section.allCases) { s in
                Text(s.rawValue).tag(s)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }
}

/// Renders the filtered word list (search, stats header, expandable cards).
/// Re-used by the main 一覧 tab and the home-screen tap-through sheets.
struct WordListContent<Trigger: Equatable>: View {
    @EnvironmentObject var store: WordStore
    let filter: WordListFilter
    /// External value whose change should collapse expanded cards (e.g. the
    /// active tab). Pass `0` if not needed.
    let resetTrigger: Trigger

    @State private var searchText = ""
    @State private var expandedIds: Set<UUID> = []
    @State private var regeneratingExamplesForId: UUID? = nil
    @State private var regenerateError: String? = nil
    @State private var showRegenerateError: Bool = false

    private var filteredWords: [Word] {
        let baseList: [Word] = (filter == .all) ? store.words : store.reviewListWords
        let filtered: [Word]
        if searchText.isEmpty {
            filtered = baseList
        } else {
            filtered = baseList.filter {
                $0.word.localizedCaseInsensitiveContains(searchText)
                || $0.definitionJapanese.localizedCaseInsensitiveContains(searchText)
                || $0.definitionEnglish.localizedCaseInsensitiveContains(searchText)
            }
        }
        switch filter {
        case .all:
            // Layered ordering: newest-today first, then daily-shuffled
            // active words, then 復習完了 words pushed to the bottom.
            let today = Calendar.current.startOfDay(for: Date())
            let newToday = filtered
                .filter { $0.createdAt >= today }
                .sorted { $0.createdAt > $1.createdAt }
            let older = filtered.filter { $0.createdAt < today }
            let active = older
                .filter { $0.reviewCount < 4 }
                .dailyShuffled()
            let completed = older
                .filter { $0.reviewCount >= 4 }
                .sorted { $0.word.lowercased() < $1.word.lowercased() }
            return newToday + active + completed
        case .reviewList:
            return filtered.sorted {
                ($0.addedToReviewListAt ?? .distantPast) > ($1.addedToReviewListAt ?? .distantPast)
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            statsHeader
            searchBox
            countLabel
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(filteredWords) { w in
                        listCard(for: w)
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
            }
        }
        .alert("例文の生成に失敗しました", isPresented: $showRegenerateError, presenting: regenerateError) { _ in
            Button("OK", role: .cancel) {}
        } message: { msg in
            Text(msg)
        }
        .onChange(of: resetTrigger) { _, _ in
            expandedIds.removeAll()
        }
    }

    private var statsHeader: some View {
        VStack(spacing: 6) {
            HStack {
                Text(filter == .all ? "英単語の復習" : "復習リスト")
                    .font(.title3.bold())
                Spacer()
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
                .tint(.indigo)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }

    private var searchBox: some View {
        HStack {
            Image(systemName: "magnifyingglass").foregroundStyle(.secondary)
            TextField("単語を検索…", text: $searchText)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(Color.white.opacity(0.82))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 16)
        .padding(.top, 12)
    }

    private var countLabel: some View {
        HStack {
            Text("\(filteredWords.count) 件")
                .font(.caption)
                .foregroundStyle(.secondary)
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 4)
        .padding(.top, 6)
    }

    @ViewBuilder
    private func listCard(for w: Word) -> some View {
        let isExpanded = expandedIds.contains(w.id)
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 8) {
                Button {
                    store.toggleReviewList(for: w)
                } label: {
                    Image(systemName: w.isInReviewList ? "checkmark.square.fill" : "square")
                        .font(.system(size: 22))
                        .foregroundStyle(w.isInReviewList ? .indigo : .secondary)
                        .frame(width: 36, height: 36)
                        .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Button {
                    if isExpanded { expandedIds.remove(w.id) } else { expandedIds.insert(w.id) }
                } label: {
                    HStack(alignment: .top, spacing: 8) {
                        Circle()
                            .fill(statusColor(w.status).opacity(0.6))
                            .frame(width: 8, height: 8)
                            .padding(.top, 8)
                        VStack(alignment: .leading, spacing: 4) {
                            Text(w.word)
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text(w.definitionJapanese.isEmpty ? w.definitionEnglish : w.definitionJapanese)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                            HStack(spacing: 8) {
                                Label("\(w.reviewCount) 回", systemImage: "repeat")
                                Text("·")
                                Text("次回 \(w.nextReviewDate.formatted(date: .abbreviated, time: .omitted))")
                                if w.isInReviewList, let added = w.addedToReviewListAt {
                                    Text("·")
                                    Text("★ \(daysRemainingLabel(addedAt: added))")
                                        .foregroundStyle(.indigo)
                                }
                            }
                            .font(.caption2)
                            .foregroundStyle(.tertiary)
                        }
                        Spacer()
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                    }
                    .padding(.vertical, 14)
                    .padding(.trailing, 14)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)
            }
            .padding(.leading, 6)

            if isExpanded {
                expandedDetail(w)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.82))
        )
        .contextMenu {
            Button(role: .destructive) {
                store.delete(id: w.id)
            } label: {
                Label("削除", systemImage: "trash")
            }
        }
    }

    @ViewBuilder
    private func expandedDetail(_ w: Word) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Divider()
            HStack(alignment: .top, spacing: 8) {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 11))
                    .foregroundStyle(.indigo)
                    .frame(width: 24, height: 24)
                    .background(Color.indigo.opacity(0.1))
                    .clipShape(Circle())
                    .onTapGesture { SpeechManager.shared.speak(w.definitionEnglish) }
                Text(w.definitionEnglish)
                    .italic()
                    .font(.subheadline)
            }
            if !w.useCases.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    Text("使う場面").font(.caption).foregroundStyle(.tertiary)
                    ForEach(w.useCases, id: \.self) { uc in
                        HStack(spacing: 6) {
                            Circle().fill(Color.indigo).frame(width: 4, height: 4)
                            Text(uc).font(.subheadline)
                        }
                    }
                }
            }
            if !w.examples.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("例文").font(.caption).foregroundStyle(.tertiary)
                        Spacer()
                        Button {
                            Task { await regenerateExamples(for: w) }
                        } label: {
                            HStack(spacing: 4) {
                                if regeneratingExamplesForId == w.id {
                                    ProgressView().scaleEffect(0.6)
                                    Text("生成中…")
                                } else {
                                    Image(systemName: "sparkles")
                                    Text("新しい例文を生成")
                                }
                            }
                            .font(.caption2)
                            .foregroundStyle(.indigo)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Capsule().fill(Color.indigo.opacity(0.12)))
                        }
                        .buttonStyle(.plain)
                        .disabled(regeneratingExamplesForId != nil)
                    }
                    ForEach(w.examples) { ex in
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
                            VStack(alignment: .leading, spacing: 1) {
                                Text(ex.english).font(.subheadline)
                                Text(ex.japanese).font(.caption).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.bottom, 14)
    }

    @MainActor
    private func regenerateExamples(for w: Word) async {
        regeneratingExamplesForId = w.id
        defer { regeneratingExamplesForId = nil }
        do {
            let new = try await GeminiService.regenerateExamples(for: w)
            let mapped = new.map { ExampleSentence(english: $0.english, japanese: $0.japanese, grammar: $0.grammar) }
            store.updateExamples(for: w.id, with: mapped)
        } catch {
            regenerateError = error.localizedDescription
            showRegenerateError = true
        }
    }

    private func statusColor(_ s: WordStatus) -> Color {
        switch s {
        case .unlearned: return .gray
        case .fuzzy:     return .orange
        case .perfect:   return .indigo
        }
    }

    private func daysRemainingLabel(addedAt: Date) -> String {
        let elapsed = Date().timeIntervalSince(addedAt)
        let remaining = (7 * 24 * 60 * 60) - elapsed
        let daysLeft = max(0, Int(ceil(remaining / (24 * 60 * 60))))
        return "あと\(daysLeft)日"
    }
}

/// Modal sheet wrapping `WordListContent` for tap-through from the home
/// screen tiles (全単語数 / 復習リスト).
struct WordListSheet: View {
    @EnvironmentObject var store: WordStore
    @Environment(\.dismiss) private var dismiss
    let filter: WordListFilter

    var body: some View {
        NavigationStack {
            WordListContent(filter: filter, resetTrigger: 0)
                .background(GeometricBackground().ignoresSafeArea())
                .navigationTitle(filter == .all ? "全単語" : "復習リスト")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("閉じる") { dismiss() }
                    }
                }
        }
    }
}

#Preview {
    WordListView(activeTab: .constant(.list))
        .environmentObject(WordStore())
}
