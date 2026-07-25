import Foundation
import AVFoundation

final class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()
    private var cachedVoice: AVSpeechSynthesisVoice?

    /// The text spoken by the previous `speak` call. Used to detect a second
    /// consecutive tap on the same button so it can be played back slowly.
    private var lastSpokenText: String?

    /// How much to slow the speech on the second consecutive tap (0.25×).
    private let slowFactor: Float = 0.25

    private init() {
        try? AVAudioSession.sharedInstance().setCategory(
            .playback,
            mode: .spokenAudio,
            options: [.mixWithOthers, .duckOthers]
        )
    }

    /// Speaks `text`. Tapping the same button twice in a row plays the second
    /// time at 0.25× speed (a slow, careful reading); a third tap returns to
    /// normal speed, and so on. Tapping a different text resets the cycle.
    func speak(_ text: String, language: String = "en-GB", rate: Float = 0.50) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }

        // Second tap on the same text → slow playback; then reset so the
        // next tap on it is normal again.
        let isRepeat = (trimmed == lastSpokenText)
        let effectiveRate = isRepeat
            ? max(rate * slowFactor, AVSpeechUtteranceMinimumSpeechRate)
            : rate
        lastSpokenText = isRepeat ? nil : trimmed

        let utterance = AVSpeechUtterance(string: trimmed)
        utterance.voice = bestVoice(for: language)
        utterance.rate = effectiveRate
        utterance.pitchMultiplier = 0.96
        utterance.preUtteranceDelay = 0
        utterance.postUtteranceDelay = 0
        synthesizer.speak(utterance)
    }

    func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        lastSpokenText = nil
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
