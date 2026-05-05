import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case quiz, list
    }

    @State private var selectedTab: Tab = .list

    var body: some View {
        TabView(selection: $selectedTab) {
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
