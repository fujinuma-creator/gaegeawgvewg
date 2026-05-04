import SwiftUI

struct ContentView: View {
    enum Tab: Hashable {
        case card, quiz, list
    }

    @State private var selectedTab: Tab = .card

    var body: some View {
        TabView(selection: $selectedTab) {
            ReviewView(activeTab: $selectedTab)
                .tabItem {
                    Label("カード", systemImage: "rectangle.on.rectangle")
                }
                .tag(Tab.card)

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
