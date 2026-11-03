import SwiftUI

@main
struct EnglishVocabAppApp: App {
    @StateObject private var store = WordStore()
    @StateObject private var settings = AppSettings.shared
    @StateObject private var purchases = PurchaseManager()
    @Environment(\.scenePhase) private var scenePhase

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(store)
                .environmentObject(settings)
                .environmentObject(purchases)
                .preferredColorScheme(.light)
                .tint(Palette.green)
        }
        .onChange(of: scenePhase) { _, phase in
            // 本日の学習時間: pause the clock while the app is in the background.
            switch phase {
            case .active: store.resumeStudy()
            case .inactive, .background: store.pauseStudy()
            @unknown default: break
            }
        }
    }
}
