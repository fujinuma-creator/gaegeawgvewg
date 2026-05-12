import SwiftUI

@main
struct ChineseVocabAppApp: App {
    @StateObject private var store = WordStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
