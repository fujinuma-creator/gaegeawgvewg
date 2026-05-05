import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: WordStore

    var body: some View {
        ZStack {
            GeometricBackground()
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Spacer(minLength: 0)
                titleRow
                grid
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 14)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .dynamicTypeSize(.medium)
    }

    // MARK: - Title

    private var titleRow: some View {
        Text("AI 英単語帳")
            .font(.system(size: 26, weight: .black, design: .rounded))
            .foregroundStyle(.black)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .padding(.horizontal, 12)
            .background(rowBackground)
    }

    // MARK: - Stats grid

    private var grid: some View {
        let cols = [
            GridItem(.flexible(), spacing: 8),
            GridItem(.flexible(), spacing: 8)
        ]
        return LazyVGrid(columns: cols, spacing: 8) {
            statTile(label: "全単語数", number: store.totalCount, suffix: "語")
            statTile(label: "復習リスト", number: store.reviewListWords.count, suffix: "語")
            progressTile(label: "本日の復習", done: store.reviewedTodayCount, total: store.dueTodayCount)
            progressTile(label: "今週の復習", done: store.reviewedThisWeekCount, total: store.dueThisWeekCount)
        }
    }

    private func statTile(label: String, number: Int, suffix: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.black)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            HStack(alignment: .lastTextBaseline, spacing: 3) {
                Text("\(number)")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text(suffix)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.5))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(rowBackground)
    }

    private func progressTile(label: String, done: Int, total: Int) -> some View {
        let safeTotal = max(total, 1)
        let progress = min(Double(done) / Double(safeTotal), 1.0)
        return VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.black)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            HStack(alignment: .lastTextBaseline, spacing: 3) {
                Text("\(done)")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text("/ \(total)")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.5))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.black)
                .scaleEffect(x: 1, y: 0.6, anchor: .center)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
        .background(rowBackground)
    }

    private var rowBackground: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(.white.opacity(0.7))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.black.opacity(0.12), lineWidth: 1)
            )
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}
