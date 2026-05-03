import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ReviewView()
                .tabItem {
                    Label("カード", systemImage: "rectangle.on.rectangle")
                }

            QuizView()
                .tabItem {
                    Label("クイズ", systemImage: "questionmark.circle")
                }

            WordListView()
                .tabItem {
                    Label("一覧", systemImage: "list.bullet")
                }
        }
        .tint(.indigo)
    }
}

#Preview {
    ContentView()
        .environmentObject(WordStore())
}
