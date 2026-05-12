import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var store: WordStore

    var body: some View {
        ZStack {
            Color(red: 0.96, green: 0.96, blue: 0.96)
                .ignoresSafeArea()

            if store.isLoading {
                ProgressView()
                    .scaleEffect(1.4)
                    .tint(accent)
            } else {
                ScrollView {
                    VStack(spacing: 24) {
                        HeaderView()
                        StatsView(stats: store.stats)

                        if let word = store.currentWord {
                            WordCardView(
                                word: word,
                                showAnswer: $store.showAnswer,
                                onReview: { store.review($0) }
                            )
                        } else {
                            CompletedView(onReset: { store.resetTodayProgress() })
                        }
                    }
                    .padding(16)
                    .padding(.bottom, 40)
                }
            }
        }
    }

    private var accent: Color { Color(red: 0/255, green: 122/255, blue: 255/255) }
}

private struct HeaderView: View {
    var body: some View {
        VStack(spacing: 4) {
            Text("Chinese Vocab")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
            Text("エビングハウス復習アプリ")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

private struct StatsView: View {
    let stats: Stats

    var body: some View {
        HStack(spacing: 8) {
            statBox(title: "全単語数", value: "\(stats.total)")
            statBox(title: "復習済み", value: "\(stats.reviewed)")
            statBox(title: "今日の復習", value: "\(stats.todayReview)")
        }
    }

    private func statBox(title: String, value: String) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.secondary)
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color(red: 0/255, green: 122/255, blue: 255/255))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ContentView()
        .environmentObject(WordStore())
}
