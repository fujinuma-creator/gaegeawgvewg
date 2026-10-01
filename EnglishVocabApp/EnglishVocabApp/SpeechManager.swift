import Foundation
import AVFoundation

final class SpeechManager {
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()
    private var cachedVoice: AVSpeechSynthesisVoice?

    /// The text spoken by the previous `speak` call. Used to detect a second
    /// consecutive tap on the same button so it can be played back slowly.
    private var lastSpokenText: String?

    /// Playback speed factors: the first tap plays at 0.25×, a second
    /// consecutive tap on the same button plays even slower at 0.1×.
    private let firstFactor: Float = 0.25
    private let secondFactor: Float = 0.1

    /// Sentences play at full speed on the first tap; a second consecutive
    /// tap on the same sentence halves it.
    private let sentenceRepeatFactor: Float = 0.5

    private init() {
        try? AVAudioSession.sharedInstance().setCategory(
            .playback,
            mode: .spokenAudio,
            options: [.mixWithOthers, .duckOthers]
        )
    }

    /// Speaks `text` slowly. The first tap plays at 0.25× speed; a second
    /// consecutive tap on the same button plays at an even slower 0.1×. A
    /// third tap returns to 0.25×, and so on. Tapping a different text resets
    /// the cycle back to 0.25×.
    ///
    /// Pass `slowed: false` for whole sentences — a conversation line read at
    /// 0.25× is unlistenable. Those play once at a natural speaking pace, and
    /// a second consecutive tap drops to 0.5× so a tricky line can still be
    /// picked apart.
    func speak(_ text: String, language: String = "en-GB", rate: Float = 0.50, slowed: Bool = true) {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }

        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }

        // First tap → 0.25×; second consecutive tap on the same text → 0.1×;
        // then reset so the next tap on it is 0.25× again.
        let isRepeat = (trimmed == lastSpokenText)
        let factor: Float
        if slowed {
            factor = isRepeat ? secondFactor : firstFactor
        } else {
            factor = isRepeat ? sentenceRepeatFactor : 1.0
        }
        let effectiveRate = max(rate * factor, AVSpeechUtteranceMinimumSpeechRate)
        lastSpokenText = isRepeat ? nil : trimmed

        let utterance = AVSpeechUtterance(string: trimmed)
        utterance.voice = bestVoice(for: language)
        // "Posh" RP: sentences are read a touch more slowly and evenly than
        // the system default, which is what gives Received Pronunciation its
        // measured, clipped feel. Single words keep the normal rate (they are
        // already slowed by the 0.25× / 0.1× factors above).
        utterance.rate = slowed ? effectiveRate : min(effectiveRate, rate * poshSentenceFactor)
        utterance.pitchMultiplier = poshPitch
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

    /// Pitch for the RP voice. 1.0 is the voice's natural pitch; the earlier
    /// 0.96 was a gravelly tweak that works against the clear, slightly
    /// bright RP delivery.
    private let poshPitch: Float = 1.0

    /// Sentence rate as a fraction of the base rate. 0.92 of the default is
    /// noticeably more deliberate without sounding slowed down.
    private let poshSentenceFactor: Float = 0.92

    /// Picks the most natural-sounding installed voice for the given
    /// language. Premium (neural) > Enhanced > Default. Within the same
    /// quality tier, prefer Apple's Received Pronunciation ("posh") British
    /// voices — Daniel and Serena are the classic RP pair, Kate and Arthur
    /// next — so the output sounds like a well-spoken UK native. The best
    /// results need the Enhanced/Premium versions downloaded in iOS Settings
    /// (Accessibility → Spoken Content → Voices → English (UK)).
    private func bestVoice(for language: String) -> AVSpeechSynthesisVoice? {
        if let cached = cachedVoice, cached.language == language {
            return cached
        }
        let preferredNames = ["Daniel", "Serena", "Kate", "Arthur", "Martha", "Jamie", "Oliver"]
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
