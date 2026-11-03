import Foundation
import SwiftUI
import Combine

enum AIProvider: String, CaseIterable, Identifiable {
    case claude = "Claude", openAI = "OpenAI", gemini = "Gemini"
    var id: String { rawValue }

    var keyURL: String {
        switch self {
        case .claude: return "console.anthropic.com/settings/keys"
        case .openAI: return "platform.openai.com/api-keys"
        case .gemini: return "aistudio.google.com/apikey"
        }
    }
    var keychainKey: String { "englishvocab.apikey.\(rawValue.lowercased())" }
}

enum Casualness: String, CaseIterable, Identifiable {
    case casual = "会話", normal = "ふつう", polite = "ていねい"
    var id: String { rawValue }

    var promptHint: String {
        switch self {
        case .casual: return "友達同士のくだけた口語（contractions や fillers を自然に使う）"
        case .normal: return "日常会話として自然な、ふつうの口語"
        case .polite: return "店員・目上の人にも使える、ていねいな英語（Could you… / Would you mind… を使う）"
        }
    }
}

/// All user preferences shown on the 設定 screen. Backed by UserDefaults.
final class AppSettings: ObservableObject {
    static let shared = AppSettings()
    private let d = UserDefaults.standard

    /// Which English the speaker buttons use (アメリカ / イギリス / Posh …).
    @Published var accent: EnglishAccent { didSet { d.set(accent.rawValue, forKey: EnglishAccent.storageKey) } }
    @Published var speechRate: Double { didSet { d.set(speechRate, forKey: "speechRate") } }          // 0.5 … 1.2
    @Published var autoSpeak: Bool { didSet { d.set(autoSpeak, forKey: "autoSpeak") } }
    @Published var provider: AIProvider {
        didSet {
            d.set(provider.rawValue, forKey: "provider")
            keyVerifiedAt = d.object(forKey: "keyVerifiedAt.\(provider.rawValue)") as? Date
        }
    }
    @Published var examplesPerRun: Int { didSet { d.set(examplesPerRun, forKey: "examplesPerRun") } }
    @Published var casualness: Casualness { didSet { d.set(casualness.rawValue, forKey: "casualness") } }
    @Published var dailyLimit: Int { didSet { d.set(dailyLimit, forKey: "dailyLimit") } }             // 0 = 無制限
    @Published var notifyEnabled: Bool { didSet { d.set(notifyEnabled, forKey: "notifyEnabled") } }
    @Published var notifyHour: Int { didSet { d.set(notifyHour, forKey: "notifyHour") } }
    @Published var notifyMinute: Int { didSet { d.set(notifyMinute, forKey: "notifyMinute") } }
    @Published var lastConversationId: String? { didSet { d.set(lastConversationId, forKey: "lastConversationId") } }
    /// When the key for the *current* provider last passed 接続テスト.
    @Published var keyVerifiedAt: Date? { didSet { d.set(keyVerifiedAt, forKey: "keyVerifiedAt.\(provider.rawValue)") } }
    /// ホーム右上のひとこと（自由に変更できる）
    @Published var motto: String { didSet { d.set(motto, forKey: "motto") } }

    private init() {
        accent = EnglishAccent(rawValue: d.string(forKey: EnglishAccent.storageKey) ?? "") ?? .default
        speechRate = d.object(forKey: "speechRate") as? Double ?? 0.9
        autoSpeak = d.object(forKey: "autoSpeak") as? Bool ?? true
        let savedProvider = AIProvider(rawValue: d.string(forKey: "provider") ?? "") ?? .claude
        provider = savedProvider
        examplesPerRun = d.object(forKey: "examplesPerRun") as? Int ?? 3
        casualness = Casualness(rawValue: d.string(forKey: "casualness") ?? "") ?? .casual
        dailyLimit = d.object(forKey: "dailyLimit") as? Int ?? 50
        notifyEnabled = d.object(forKey: "notifyEnabled") as? Bool ?? false
        notifyHour = d.object(forKey: "notifyHour") as? Int ?? 8
        notifyMinute = d.object(forKey: "notifyMinute") as? Int ?? 0
        lastConversationId = d.string(forKey: "lastConversationId")
        keyVerifiedAt = d.object(forKey: "keyVerifiedAt.\(savedProvider.rawValue)") as? Date
        motto = d.string(forKey: "motto") ?? "頑張ろう"
    }

    var dailyLimitLabel: String { dailyLimit == 0 ? "制限なし" : "\(dailyLimit)語" }
    var notifyLabel: String {
        notifyEnabled ? String(format: "毎日 %d:%02d", notifyHour, notifyMinute) : "オフ"
    }
}
