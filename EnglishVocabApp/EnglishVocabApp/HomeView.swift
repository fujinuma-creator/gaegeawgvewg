import SwiftUI

struct HomeView: View {
    @EnvironmentObject var store: WordStore

    var body: some View {
        ZStack {
            GeometricBackground()
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 14) {
                    titleBlock
                    statsBlock
                }
                .padding(.horizontal, 16)
                .padding(.top, 12)
                .padding(.bottom, 24)
                .frame(maxWidth: .infinity)
            }
        }
    }

    private var titleBlock: some View {
        VStack(spacing: 4) {
            Text("AI 英単語帳")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundStyle(.black)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
            Text("AI English Vocabulary")
                .font(.caption.weight(.medium))
                .foregroundStyle(.black.opacity(0.55))
                .tracking(2)
                .minimumScaleFactor(0.7)
                .lineLimit(1)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.white.opacity(0.6))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black.opacity(0.15), lineWidth: 1)
                )
        )
    }

    private var statsBlock: some View {
        VStack(spacing: 10) {
            totalRow
            progressRow(
                title: "本日の復習",
                subtitle: "Today",
                done: store.reviewedTodayCount,
                total: store.dueTodayCount
            )
            progressRow(
                title: "今週の復習",
                subtitle: "This week",
                done: store.reviewedThisWeekCount,
                total: store.dueThisWeekCount
            )
        }
    }

    private var totalRow: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading, spacing: 2) {
                Text("全単語数")
                    .font(.subheadline.bold())
                    .foregroundStyle(.black)
                Text("Total words")
                    .font(.caption2)
                    .foregroundStyle(.black.opacity(0.5))
                    .tracking(1)
            }
            Spacer()
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(store.totalCount)")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text("語")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.5))
            }
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(rowBackground)
    }

    private func progressRow(title: String, subtitle: String, done: Int, total: Int) -> some View {
        let safeTotal = max(total, 1)
        let progress = min(Double(done) / Double(safeTotal), 1.0)
        return VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .lastTextBaseline) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.subheadline.bold())
                        .foregroundStyle(.black)
                    Text(subtitle)
                        .font(.caption2)
                        .foregroundStyle(.black.opacity(0.5))
                        .tracking(1)
                }
                Spacer()
                HStack(alignment: .lastTextBaseline, spacing: 4) {
                    Text("\(done)")
                        .font(.system(size: 26, weight: .black, design: .rounded))
                        .foregroundStyle(.black)
                    Text("/ \(total)")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundStyle(.black.opacity(0.5))
                }
            }
            ProgressView(value: progress)
                .progressViewStyle(.linear)
                .tint(.black)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
        .background(rowBackground)
    }

    private var rowBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.white.opacity(0.7))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.black.opacity(0.12), lineWidth: 1)
            )
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}
