import Foundation
import AVFoundation

/// The English accent used for all playback. Picked in 設定 → 音声 and
/// stored in UserDefaults under `EnglishAccent.storageKey`.
enum EnglishAccent: String, CaseIterable, Identifiable {
    case american = "us"
    case british = "uk"
    case britishPosh = "ukPosh"
    case australian = "au"
    case indian = "in"
    case irish = "ie"
    case scottish = "scot"
    case southAfrican = "za"

    static let storageKey = "speech.accent"
    static let `default`: EnglishAccent = .britishPosh

    var id: String { rawValue }

    var label: String {
        switch self {
        case .american:     return "アメリカ英語"
        case .british:      return "イギリス英語"
        case .britishPosh:  return "イギリス英語（Posh）"
        case .australian:   return "オーストラリア英語"
        case .indian:       return "インド英語"
        case .irish:        return "アイルランド英語"
        case .scottish:     return "スコットランド英語"
        case .southAfrican: return "南アフリカ英語"
        }
    }

    var flag: String {
        switch self {
        case .american:     return "🇺🇸"
        case .british:      return "🇬🇧"
        case .britishPosh:  return "🎩"
        case .australian:   return "🇦🇺"
        case .indian:       return "🇮🇳"
        case .irish:        return "🇮🇪"
        case .scottish:     return "🏴󠁧󠁢󠁳󠁣󠁴󠁿"
        case .southAfrican: return "🇿🇦"
        }
    }

    /// Language codes to try, in order.
    var languageCodes: [String] {
        switch self {
        case .american:     return ["en-US"]
        case .british:      return ["en-GB"]
        case .britishPosh:  return ["en-GB"]
        case .australian:   return ["en-AU"]
        case .indian:       return ["en-IN"]
        case .irish:        return ["en-IE"]
        // Apple tags the Scottish voice as "en-scotland", not an ISO code.
        case .scottish:     return ["en-scotland", "en-GB-scotland", "en-GB"]
        case .southAfrican: return ["en-ZA"]
        }
    }

    /// Voice names to prefer within the best installed quality tier. Posh
    /// leads with Daniel and Serena, Apple's Received Pronunciation pair;
    /// standard British leads with the more everyday Kate and Oliver.
    var preferredNames: [String] {
        switch self {
        case .american:     return ["Ava", "Samantha", "Evan", "Zoe", "Allison", "Tom", "Alex"]
        case .british:      return ["Kate", "Oliver", "Arthur", "Martha", "Daniel", "Serena"]
        case .britishPosh:  return ["Daniel", "Serena", "Kate", "Arthur", "Martha", "Jamie"]
        case .australian:   return ["Karen", "Lee", "Catherine", "Matilda"]
        case .indian:       return ["Rishi", "Isha", "Veena", "Neel"]
        case .irish:        return ["Moira"]
        case .scottish:     return ["Fiona"]
        case .southAfrican: return ["Tessa"]
        }
    }

    /// The accent currently chosen by the user.
    static var current: EnglishAccent {
        let raw = UserDefaults.standard.string(forKey: storageKey) ?? ""
        return EnglishAccent(rawValue: raw) ?? .default
    }
}

/// English text-to-speech. The accent and base speed come from `AppSettings`;
/// a second consecutive tap on the same text plays it at quarter speed, the
/// tap after that is back to normal.
final class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()
    private var lastSpokenText: String?
    private var cachedVoice: AVSpeechSynthesisVoice?
    private var cachedAccent: EnglishAccent?

    /// Second consecutive tap on the same text → 0.25×.
    private let repeatFactor: Float = 0.25

    private init() {
        let session = AVAudioSession.sharedInstance()
        try? session.setCategory(.playback, mode: .spokenAudio, options: [.mixWithOthers, .duckOthers])
        try? session.setActive(true, options: .notifyOthersOnDeactivation)
    }

    func speak(_ text: String, slow: Bool = false) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        if synthesizer.isSpeaking { synthesizer.stopSpeaking(at: .immediate) }

        let settings = AppSettings.shared
        let isRepeat = trimmed == lastSpokenText
        lastSpokenText = isRepeat ? nil : trimmed

        var rate = Float(settings.speechRate) * AVSpeechUtteranceDefaultSpeechRate
        if slow || isRepeat { rate *= repeatFactor }
        rate = max(AVSpeechUtteranceMinimumSpeechRate, min(rate, AVSpeechUtteranceMaximumSpeechRate))

        let u = AVSpeechUtterance(string: trimmed)
        u.voice = bestVoice(for: settings.accent)
        u.rate = rate
        u.preUtteranceDelay = 0
        u.postUtteranceDelay = 0
        synthesizer.speak(u)
    }

    func stop() {
        if synthesizer.isSpeaking { synthesizer.stopSpeaking(at: .immediate) }
        lastSpokenText = nil
    }

    /// e.g. "Daniel（拡張）" for the settings screen, so it is obvious when the
    /// Enhanced / Premium voice still needs downloading.
    func voiceDescription(for accent: EnglishAccent) -> String {
        guard let v = pickVoice(for: accent) else { return "音声なし" }
        let q: String
        switch v.quality {
        case .premium: q = "プレミアム"
        case .enhanced: q = "拡張"
        default: q = "標準"
        }
        return "\(v.name)（\(q)）"
    }

    private func bestVoice(for accent: EnglishAccent) -> AVSpeechSynthesisVoice? {
        if let cached = cachedVoice, cachedAccent == accent { return cached }
        let chosen = pickVoice(for: accent)
        cachedVoice = chosen
        cachedAccent = accent
        return chosen
    }

    /// Premium (neural) > Enhanced > Default; within the same quality tier
    /// the accent's preferred names win. The best results need the
    /// Enhanced / Premium voices downloaded in iOS Settings (Accessibility →
    /// Spoken Content → Voices → English).
    private func pickVoice(for accent: EnglishAccent) -> AVSpeechSynthesisVoice? {
        let all = AVSpeechSynthesisVoice.speechVoices()

        func qualityRank(_ q: AVSpeechSynthesisVoiceQuality) -> Int {
            switch q {
            case .premium:  return 3
            case .enhanced: return 2
            default:        return 1
            }
        }

        for code in accent.languageCodes {
            let voices = all.filter { $0.language.caseInsensitiveCompare(code) == .orderedSame }
            guard !voices.isEmpty else { continue }
            let names = accent.preferredNames
            let sorted = voices.sorted { a, b in
                let qa = qualityRank(a.quality)
                let qb = qualityRank(b.quality)
                if qa != qb { return qa > qb }
                let na = names.firstIndex(where: { a.name.contains($0) }) ?? Int.max
                let nb = names.firstIndex(where: { b.name.contains($0) }) ?? Int.max
                return na < nb
            }
            if let v = sorted.first { return v }
        }
        return AVSpeechSynthesisVoice(language: accent.languageCodes.last)
    }
}
