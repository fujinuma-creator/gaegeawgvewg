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

    @State private var searchText = ""
    @State private var filter: ListFilter = .all
    @State private var expandedIds: Set<UUID> = []
    @State private var showAddSheet = false

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
        return filtered.sorted { $0.createdAt > $1.createdAt }
    }

    var body: some View {
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
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .overlay(alignment: .bottomTrailing) {
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
        .onChange(of: filter) { _, _ in
            // Switching filter (e.g. すべて → 復習リスト) collapses any
            // currently-open cards so the new filtered list starts fresh.
            expandedIds.removeAll()
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
        .background(Color(.secondarySystemGroupedBackground))
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
                        .background(isSelected ? Color.black : Color(.secondarySystemGroupedBackground))
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
                .fill(Color(.secondarySystemGroupedBackground))
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
                    Text("例文").font(.caption).foregroundStyle(.tertiary)
                    ForEach(w.examples) { ex in
                        VStack(alignment: .leading, spacing: 1) {
                            Text(ex.english).font(.subheadline)
                            Text(ex.japanese).font(.caption).foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 14)
        .padding(.bottom, 14)
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
