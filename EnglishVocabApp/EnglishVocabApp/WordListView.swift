import SwiftUI

struct WordListView: View {
    @EnvironmentObject var store: WordStore
    @Binding var activeTab: ContentView.Tab

    enum ListFilter: String, CaseIterable, Identifiable {
        case all = "すべて"
        case reviewList = "復習リスト"
        var id: String { rawValue }

        var symbol: String {
            switch self {
            case .all: return ""
            case .reviewList: return "★"
            }
        }
    }

    enum Section: String, CaseIterable, Identifiable {
        case list = "一覧"
        case card = "カード"
        case shadowing = "シャドウイング"
        var id: String { rawValue }
    }

    @State private var section: Section = .list
    @State private var searchText = ""
    @State private var filter: ListFilter = .all
    @State private var expandedIds: Set<UUID> = []
    @State private var showAddSheet = false
    @State private var regeneratingExamplesForId: UUID? = nil
    @State private var regenerateError: String? = nil
    @State private var showRegenerateError: Bool = false

    var filteredWords: [Word] {
        let byStatus: [Word]
        switch filter {
        case .all:        byStatus = store.words
        case .reviewList: byStatus = store.reviewListWords
        }
        let filtered: [Word]
        if searchText.isEmpty {
            filtered = byStatus
        } else {
            filtered = byStatus.filter {
                $0.word.localizedCaseInsensitiveContains(searchText)
                || $0.definitionJapanese.localizedCaseInsensitiveContains(searchText)
                || $0.definitionEnglish.localizedCaseInsensitiveContains(searchText)
            }
        }
        switch filter {
        case .all:
            // Words added today appear at the very top (newest first), so
            // freshly-added words are easy to find. Everything older is
            // shown in the daily-rotating random order.
            let today = Calendar.current.startOfDay(for: Date())
            let newToday = filtered
                .filter { $0.createdAt >= today }
                .sorted { $0.createdAt > $1.createdAt }
            let older = filtered
                .filter { $0.createdAt < today }
                .dailyShuffled()
            return newToday + older
        case .reviewList:
            // Most-recently pinned first.
            return filtered.sorted {
                ($0.addedToReviewListAt ?? .distantPast) > ($1.addedToReviewListAt ?? .distantPast)
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            sectionPicker
            switch section {
            case .list:
                listSection
            case .card:
                ReviewView(activeTab: $activeTab)
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
                // Leaving the list tab — collapse every expanded card
                // and dismiss the add-word sheet so coming back is clean.
                expandedIds.removeAll()
                showAddSheet = false
            }
        }
        .alert("例文の生成に失敗しました", isPresented: $showRegenerateError, presenting: regenerateError) { _ in
            Button("OK", role: .cancel) {}
        } message: { msg in
            Text(msg)
        }
        .onChange(of: filter) { _, _ in
            // Switching filter (e.g. すべて → 復習リスト) collapses any
            // currently-open cards so the new filtered list starts fresh.
            expandedIds.removeAll()
        }
    }

    // MARK: - Section picker + list body

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

    private var listSection: some View {
        VStack(spacing: 0) {
            statsHeader
            searchBox
            filterPills
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
    }

    // MARK: - Stats header

    private var statsHeader: some View {
        VStack(spacing: 6) {
            HStack {
                Text("英単語の復習").font(.title3.bold())
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

    // MARK: - Search

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

    // MARK: - Filter pills

    private var filterPills: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ListFilter.allCases) { f in
                    Button {
                        filter = f
                    } label: {
                        let isSelected = filter == f
                        HStack(spacing: 4) {
                            if !f.symbol.isEmpty {
                                Text(f.symbol)
                            }
                            Text(f.rawValue)
                        }
                        .font(.subheadline.weight(isSelected ? .semibold : .regular))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(isSelected ? Color.black : Color.white.opacity(0.82))
                        .foregroundStyle(isSelected ? .white : .primary)
                        .clipShape(Capsule())
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
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
    }

    // MARK: - List card

    @ViewBuilder
    private func listCard(for w: Word) -> some View {
        let isExpanded = expandedIds.contains(w.id)
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 8) {
                // Review-list checkbox
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

#Preview {
    WordListView(activeTab: .constant(.list))
        .environmentObject(WordStore())
}
