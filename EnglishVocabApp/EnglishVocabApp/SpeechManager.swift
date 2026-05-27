import Foundation
import AVFoundation

final class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()
    private var cachedVoice: AVSpeechSynthesisVoice?

    private init() {
        try? AVAudioSession.sharedInstance().setCategory(
            .playback,
            mode: .spokenAudio,
            options: [.mixWithOthers, .duckOthers]
        )
    }

    func speak(_ text: String, language: String = "en-GB", rate: Float = 0.50) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }

        let utterance = AVSpeechUtterance(string: trimmed)
        utterance.voice = bestVoice(for: language)
        utterance.rate = rate
        utterance.pitchMultiplier = 0.96
        utterance.preUtteranceDelay = 0
        utterance.postUtteranceDelay = 0
        synthesizer.speak(utterance)
    }

    func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
    }

    /// Picks the most natural-sounding installed voice for the given
    /// language. Premium (neural) > Enhanced > Default. Within the same
    /// quality tier, prefer the British male voices (Daniel, Oliver,
    /// Arthur) so the output sounds like a fluent UK native.
    private func bestVoice(for language: String) -> AVSpeechSynthesisVoice? {
        if let cached = cachedVoice, cached.language == language {
            return cached
        }
        let preferredNames = ["Daniel", "Oliver", "Arthur"]
        let voices = AVSpeechSynthesisVoice.speechVoices()
            .filter { $0.language == language }

        func qualityRank(_ q: AVSpeechSynthesisVoiceQuality) -> Int {
            switch q {
            case .premium:  return 3
            case .enhanced: return 2
            default:        return 1
            }
        }

        let sorted = voices.sorted { a, b in
            let qa = qualityRank(a.quality)
            let qb = qualityRank(b.quality)
            if qa != qb { return qa > qb }
            let na = preferredNames.firstIndex(where: { a.name.contains($0) }) ?? Int.max
            let nb = preferredNames.firstIndex(where: { b.name.contains($0) }) ?? Int.max
            return na < nb
        }

        let chosen = sorted.first ?? AVSpeechSynthesisVoice(language: language)
        cachedVoice = chosen
        return chosen
    }
}
