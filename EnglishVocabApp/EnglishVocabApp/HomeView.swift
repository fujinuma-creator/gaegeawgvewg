import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: WordStore

    var body: some View {
        ZStack {
            GeometricBackground()
                .ignoresSafeArea()

            VStack(spacing: 8) {
                Spacer(minLength: 0)
                titleRow
                statRow(label: "全単語数", number: store.totalCount, suffix: "語")
                progressRow(label: "本日の復習", done: store.reviewedTodayCount, total: store.dueTodayCount)
                progressRow(label: "今週の復習", done: store.reviewedThisWeekCount, total: store.dueThisWeekCount)
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .dynamicTypeSize(.medium)
    }

    // MARK: - Title

    private var titleRow: some View {
        Text("AI 英単語帳")
            .font(.system(size: 24, weight: .black, design: .rounded))
            .foregroundStyle(.black)
            .minimumScaleFactor(0.5)
            .lineLimit(1)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(rowBackground)
    }

    // MARK: - Stat rows

    private func statRow(label: String, number: Int, suffix: String) -> some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label)
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(.black)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            Spacer(minLength: 8)
            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("\(number)")
                    .font(.system(size: 22, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text(suffix)
                    .font(.system(size: 12, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.5))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(rowBackground)
    }

    private func progressRow(label: String, done: Int, total: Int) -> some View {
        let safeTotal = max(total, 1)
        let progress = min(Double(done) / Double(safeTotal), 1.0)
        return VStack(spacing: 3) {
            HStack(alignment: .firstTextBaseline) {
                Text(label)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.black)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                Spacer(minLength: 8)
                HStack(alignment: .firstTextBaseline, spacing: 3) {
                    Text("\(done)")
                        .font(.system(size: 22, weight: .black, design: .rounded))
                        .foregroundStyle(.black)
                    Text("/ \(total)")
                        .font(.system(size: 12, weight: .semibold, design: .rounded))
                        .foregroundStyle(.black.opacity(0.5))
                }
                .lineLimit(1)
                .minimumScaleFactor(0.7)
            }
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.black)
                .scaleEffect(x: 1, y: 0.6, anchor: .center)
        }
        .padding(.vertical, 6)
        .padding(.horizontal, 12)
        .background(rowBackground)
    }

    private var rowBackground: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.white.opacity(0.7))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.black.opacity(0.12), lineWidth: 1)
            )
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}
