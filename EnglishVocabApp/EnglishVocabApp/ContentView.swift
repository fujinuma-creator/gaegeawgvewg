import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ReviewView()
                .tabItem {
                    Label("復習", systemImage: "rectangle.stack.fill")
                }

            WordListView()
                .tabItem {
                    Label("単語帳", systemImage: "book.fill")
                }

            AddWordView()
                .tabItem {
                    Label("追加", systemImage: "plus.circle.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(WordStore())
}
