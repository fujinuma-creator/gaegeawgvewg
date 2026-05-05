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
                statTile(label: "全単語数", number: store.totalCount, suffix: "語")
                statTile(label: "復習リスト", number: store.reviewListWords.count, suffix: "語")
                progressTile(label: "本日の復習", done: store.reviewedTodayCount, total: store.dueTodayCount)
                progressTile(label: "今週の復習", done: store.reviewedThisWeekCount, total: store.dueThisWeekCount)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .dynamicTypeSize(.medium)
    }

    // MARK: - Title

    private var titleRow: some View {
        VStack(spacing: 2) {
            Text("AI 英単語帳")
                .font(.system(size: 34, weight: .black, design: .rounded))
                .foregroundStyle(.white)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
                .shadow(color: .white.opacity(0.4), radius: 8)
            Text("AI English Vocabulary")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.white.opacity(0.6))
                .tracking(2)
                .lineLimit(1)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
    }

    // MARK: - Tiles (centered, white-on-translucent over space)

    private func statTile(label: String, number: Int, suffix: String) -> some View {
        VStack(spacing: 3) {
            Text(label)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.white.opacity(0.75))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(number)")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                Text(suffix)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.6))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(tileBackground)
    }

    private func progressTile(label: String, done: Int, total: Int) -> some View {
        let safeTotal = max(total, 1)
        let progress = min(Double(done) / Double(safeTotal), 1.0)
        return VStack(spacing: 3) {
            Text(label)
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.white.opacity(0.75))
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(done)")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundStyle(.white)
                Text("/ \(total)")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.6))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.white)
                .scaleEffect(x: 1, y: 0.6, anchor: .center)
                .frame(maxWidth: 180)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(tileBackground)
    }

    private var tileBackground: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(.white.opacity(0.08))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.white.opacity(0.20), lineWidth: 0.8)
            )
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}
