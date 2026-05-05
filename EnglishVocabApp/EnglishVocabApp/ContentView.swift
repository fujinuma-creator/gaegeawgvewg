import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case home, quiz, list
    }

    @State private var selectedTab: Tab = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("ホーム", systemImage: "house.fill")
                }
                .tag(Tab.home)

            QuizView(activeTab: $selectedTab)
                .tabItem {
                    Label("クイズ", systemImage: "questionmark.circle")
                }
                .tag(Tab.quiz)

            WordListView(activeTab: $selectedTab)
                .tabItem {
                    Label("一覧", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
        .environmentObject(WordStore())
}
