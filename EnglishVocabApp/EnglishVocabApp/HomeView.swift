import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: WordStore

    var body: some View {
        ZStack {
            GeometricBackground()
                .ignoresSafeArea()

            VStack(spacing: 14) {
                titleBlock
                statsBlock
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 14)
            .padding(.top, 8)
            .padding(.bottom, 12)
        }
        // Lock dynamic type so the home dashboard fits even when the
        // user's iOS-wide text size is set very large.
        .dynamicTypeSize(.medium)
    }

    private var titleBlock: some View {
        VStack(spacing: 2) {
            Text("AI 英単語帳")
                .font(.system(size: 26, weight: .black, design: .rounded))
                .foregroundStyle(.black)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            Text("AI English Vocabulary")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.black.opacity(0.55))
                .tracking(2)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 14)
        .frame(maxWidth: .infinity)
        .background(rowBackground(corner: 14))
    }

    private var statsBlock: some View {
        VStack(spacing: 8) {
            statRow(title: "全単語数", subtitle: "Total words", number: store.totalCount, suffix: "語", showProgress: false, total: store.totalCount)
            statRow(title: "本日の復習", subtitle: "Today", number: store.reviewedTodayCount, suffix: "/ \(store.dueTodayCount)", showProgress: true, total: store.dueTodayCount)
            statRow(title: "今週の復習", subtitle: "This week", number: store.reviewedThisWeekCount, suffix: "/ \(store.dueThisWeekCount)", showProgress: true, total: store.dueThisWeekCount)
        }
    }

    @ViewBuilder
    private func statRow(
        title: String,
        subtitle: String,
        number: Int,
        suffix: String,
        showProgress: Bool,
        total: Int
    ) -> some View {
        let progress: Double = {
            let safeTotal = max(total, 1)
            return min(Double(number) / Double(safeTotal), 1.0)
        }()

        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .lastTextBaseline) {
                VStack(alignment: .leading, spacing: 1) {
                    Text(title)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(.black)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                    Text(subtitle)
                        .font(.system(size: 9))
                        .foregroundStyle(.black.opacity(0.5))
                        .tracking(1)
                        .lineLimit(1)
                }
                Spacer(minLength: 8)
                HStack(alignment: .lastTextBaseline, spacing: 3) {
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

            if showProgress {
                ProgressView(value: progress)
                    .progressViewStyle(.linear)
                    .tint(.black)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 14)
        .background(rowBackground(corner: 14))
    }

    private func rowBackground(corner: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: corner)
            .fill(.white.opacity(0.7))
            .overlay(
                RoundedRectangle(cornerRadius: corner)
                    .stroke(Color.black.opacity(0.12), lineWidth: 1)
            )
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}
