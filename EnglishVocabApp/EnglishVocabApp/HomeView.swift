import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: WordStore

    @State private var showAllWords = false
    @State private var showReviewList = false
    @State private var showRankedList = false

    var body: some View {
        ZStack {
            GeometricBackground()
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Spacer(minLength: 0)
                titleRow
                Button {
                    showAllWords = true
                } label: {
                    statTile(label: "全単語数", number: store.totalCount, suffix: "語", tappable: true)
                }
                .buttonStyle(.plain)
                Button {
                    showReviewList = true
                } label: {
                    statTile(label: "復習リスト", number: store.reviewListWords.count, suffix: "語", tappable: true)
                }
                .buttonStyle(.plain)
                Button {
                    showRankedList = true
                } label: {
                    statTile(label: "復習リスト（会話頻度順）", number: store.rankedWords.count, suffix: "語", tappable: true)
                }
                .buttonStyle(.plain)
                progressTile(label: "本日の復習", done: store.reviewedTodayCount, total: store.dueTodayCount)
                progressTile(label: "今週の復習", done: store.reviewedThisWeekCount, total: store.dueThisWeekCount)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .dynamicTypeSize(.medium)
        .sheet(isPresented: $showAllWords) {
            WordListSheet(filter: .all)
                .environmentObject(store)
        }
        .sheet(isPresented: $showReviewList) {
            WordListSheet(filter: .reviewList)
                .environmentObject(store)
        }
        .sheet(isPresented: $showRankedList) {
            NavigationStack {
                RankedReviewListView()
                    .environmentObject(store)
                    .navigationTitle("復習リスト（会話頻度順）")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("閉じる") { showRankedList = false }
                        }
                    }
            }
        }
    }

    // MARK: - Title

    private var titleRow: some View {
        VStack(spacing: 2) {
            Text("AI 英単語帳")
                .font(.system(size: 34, weight: .black, design: .rounded))
                .foregroundStyle(.black)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
            Text("AI English Vocabulary")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.black.opacity(0.55))
                .tracking(2)
                .lineLimit(1)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity)
        .background(tileBackground)
    }

    // MARK: - Tiles (centered, dark text on solid white card)

    private func statTile(label: String, number: Int, suffix: String, tappable: Bool = false) -> some View {
        VStack(spacing: 3) {
            HStack(spacing: 4) {
                Text(label)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.black.opacity(0.7))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                if tappable {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.black.opacity(0.45))
                }
            }
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(number)")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text(suffix)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.55))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(tileBackground)
        .contentShape(Rectangle())
    }

    private func progressTile(label: String, done: Int, total: Int) -> some View {
        let safeTotal = max(total, 1)
        let progress = min(Double(done) / Double(safeTotal), 1.0)
        return VStack(spacing: 3) {
            Text(label)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.black.opacity(0.7))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(done)")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text("/ \(total)")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.55))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.black)
                .scaleEffect(x: 1, y: 0.6, anchor: .center)
                .frame(maxWidth: 180)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(tileBackground)
    }

    /// Truly translucent card: a thin white wash so the math-paper and
    /// solar-system elements behind it are clearly visible through the
    /// surface, with a darker stroke and a small shadow keeping text
    /// edges legible.
    private var tileBackground: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.42))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.black.opacity(0.22), lineWidth: 0.8)
            )
            .shadow(color: .black.opacity(0.06), radius: 3, y: 1)
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}
