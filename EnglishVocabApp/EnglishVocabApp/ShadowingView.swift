import SwiftUI
import AVFoundation

// MARK: - Model

/// One shadowing sentence: English, its British-RP IPA, Japanese and tips.
struct ShadowingItem: Identifiable, Hashable {
    let id: String
    let english: String
    let japanese: String
    let ipa: String
    let tips: [String]

    /// Words as shown (punctuation stays attached, e.g. "idea.").
    var words: [String] { english.split(separator: " ").map(String.init) }

    /// UTF-16 offset of each word in `english`, for starting speech mid-sentence.
    var wordOffsets: [Int] {
        var out: [Int] = []
        var inWord = false
        for (i, u) in english.utf16.enumerated() {
            let isSpace = u == 32
            if !isSpace && !inWord { out.append(i) }
            inWord = !isSpace
        }
        return out
    }
}

enum ShadowingSpeed: Double, CaseIterable, Identifiable {
    case x10 = 1.0, x08 = 0.8, x05 = 0.5, x04 = 0.4, x03 = 0.3, x02 = 0.2
    var id: Double { rawValue }
    var label: String { rawValue == 1 ? "1倍" : String(format: "%.1f倍", rawValue) }
}

// MARK: - Player

/// Plays a shadowing sentence from any word at 1×–0.2×.
///
/// With a recorded file (ShadowingAudio/shadow_<id>.m4a) it uses
/// AVAudioEngine + a time-pitch unit, so the voice slows down without
/// dropping in pitch (AVAudioPlayer can't go below 0.5×). Word timings come
/// from shadow_<id>.json when present, otherwise they are estimated from the
/// word lengths. Without a file the iPhone voice reads the sentence instead.
final class ShadowingPlayer: NSObject, ObservableObject, AVSpeechSynthesizerDelegate, @unchecked Sendable {
    static let shared = ShadowingPlayer()

    @Published private(set) var playingId: String? = nil
    @Published private(set) var currentWord: Int? = nil

    private let engine = AVAudioEngine()
    private let node = AVAudioPlayerNode()
    private let timePitch = AVAudioUnitTimePitch()
    private var attached = false
    private var timer: Timer?
    private var fileStart: TimeInterval = 0
    private var wordTimes: [TimeInterval] = []
    /// Bumped on every play/stop so stale completion callbacks are ignored.
    private var token = 0

    private let synth = AVSpeechSynthesizer()
    private var ttsOffset = 0
    private var ttsWordOffsets: [Int] = []
    private var ttsUtterance: AVSpeechUtterance?

    private override init() {
        super.init()
        _ = SpeechManager.shared   // sets up the playback audio session
        synth.delegate = self
    }

    // MARK: Files

    static func audioURL(for item: ShadowingItem) -> URL? {
        for ext in ["m4a", "mp3", "wav", "caf"] {
            if let u = Bundle.main.url(forResource: "shadow_\(item.id)", withExtension: ext, subdirectory: "ShadowingAudio") {
                return u
            }
        }
        return nil
    }

    static func hasAudio(_ item: ShadowingItem) -> Bool { audioURL(for: item) != nil }

    /// Start time of each word in seconds.
    static func timings(for item: ShadowingItem, duration: TimeInterval) -> [TimeInterval] {
        let words = item.words
        if let url = Bundle.main.url(forResource: "shadow_\(item.id)", withExtension: "json", subdirectory: "ShadowingAudio"),
           let data = try? Data(contentsOf: url),
           let times = try? JSONDecoder().decode([Double].self, from: data),
           times.count == words.count {
            return times
        }
        // Estimate: time proportional to letters, plus pauses after punctuation.
        let lead = min(0.15, duration * 0.05), tail = min(0.25, duration * 0.08)
        var weights: [Double] = []
        for w in words {
            var weight = Double(w.filter { $0.isLetter || $0.isNumber }.count) + 1.5
            if let last = w.last {
                if ",;:".contains(last) { weight += 3 }
                if ".?!".contains(last) { weight += 5 }
            }
            weights.append(weight)
        }
        let total = weights.reduce(0, +)
        let usable = max(0.1, duration - lead - tail)
        var t = lead
        var out: [TimeInterval] = []
        for w in weights {
            out.append(t)
            t += usable * w / total
        }
        return out
    }

    // MARK: Control

    func play(_ item: ShadowingItem, fromWord word: Int = 0, speed: Double) {
        stop()
        SpeechManager.shared.stop()
        let start = max(0, min(word, item.words.count - 1))
        playingId = item.id
        currentWord = start
        BGMManager.shared.duck(true)
        if let url = Self.audioURL(for: item), playFile(url, item: item, fromWord: start, speed: speed) {
            return
        }
        playTTS(item, fromWord: start, speed: speed)
    }

    func stop() {
        token += 1
        timer?.invalidate()
        timer = nil
        if node.isPlaying { node.stop() }
        if synth.isSpeaking { synth.stopSpeaking(at: .immediate) }
        ttsUtterance = nil
        if playingId != nil {
            playingId = nil
            currentWord = nil
            BGMManager.shared.duck(false)
        }
    }

    private func finish(_ t: Int) {
        guard t == token else { return }
        stop()
    }

    private func playFile(_ url: URL, item: ShadowingItem, fromWord: Int, speed: Double) -> Bool {
        guard let file = try? AVAudioFile(forReading: url) else { return false }
        let format = file.processingFormat
        if !attached {
            engine.attach(node)
            engine.attach(timePitch)
            attached = true
        }
        engine.disconnectNodeOutput(node)
        engine.disconnectNodeOutput(timePitch)
        engine.connect(node, to: timePitch, format: format)
        engine.connect(timePitch, to: engine.mainMixerNode, format: format)
        timePitch.rate = Float(speed)

        let sr = format.sampleRate
        let duration = Double(file.length) / sr
        wordTimes = Self.timings(for: item, duration: duration)
        let startTime = max(0, (wordTimes.indices.contains(fromWord) ? wordTimes[fromWord] : 0) - 0.04)
        let startFrame = AVAudioFramePosition(startTime * sr)
        guard startFrame < file.length else { return false }
        let frames = AVAudioFrameCount(file.length - startFrame)

        do {
            if !engine.isRunning {
                engine.prepare()
                try engine.start()
            }
        } catch {
            return false
        }
        let t = token
        fileStart = startTime
        node.scheduleSegment(file, startingFrame: startFrame, frameCount: frames, at: nil,
                             completionCallbackType: .dataPlayedBack) { [weak self] _ in
            DispatchQueue.main.async { self?.finish(t) }
        }
        node.play()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 30, repeats: true) { [weak self] _ in
            self?.tick()
        }
        return true
    }

    private func tick() {
        guard let nodeTime = node.lastRenderTime,
              let pt = node.playerTime(forNodeTime: nodeTime), pt.sampleRate > 0 else { return }
        let now = fileStart + Double(pt.sampleTime) / pt.sampleRate
        let idx = (wordTimes.lastIndex { $0 <= now + 0.02 }) ?? 0
        if idx != currentWord { currentWord = idx }
    }

    private func playTTS(_ item: ShadowingItem, fromWord: Int, speed: Double) {
        let offsets = item.wordOffsets
        let startOffset = offsets.indices.contains(fromWord) ? offsets[fromWord] : 0
        let ns = item.english as NSString
        let text = ns.substring(from: startOffset)
        ttsOffset = startOffset
        ttsWordOffsets = offsets
        let u = AVSpeechUtterance(string: text)
        u.voice = SpeechManager.shared.currentVoice()
        let rate = Float(AppSettings.shared.speechRate) * AVSpeechUtteranceDefaultSpeechRate * Float(speed)
        u.rate = max(AVSpeechUtteranceMinimumSpeechRate, min(rate, AVSpeechUtteranceMaximumSpeechRate))
        u.preUtteranceDelay = 0
        ttsUtterance = u
        synth.speak(u)
    }

    // MARK: AVSpeechSynthesizerDelegate

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            guard utterance === self.ttsUtterance else { return }
            let loc = characterRange.location + self.ttsOffset
            let idx = (self.ttsWordOffsets.lastIndex { $0 <= loc }) ?? 0
            if idx != self.currentWord { self.currentWord = idx }
        }
    }

    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        DispatchQueue.main.async {
            guard utterance === self.ttsUtterance else { return }
            self.stop()
        }
    }
}

// MARK: - Section shown in 発音 → シャドウイング

struct ShadowingSection: View {
    @ObservedObject private var player = ShadowingPlayer.shared
    @AppStorage("shadowing.speed") private var speedRaw: Double = 1.0
    @AppStorage("shadowing.done") private var doneRaw: String = ""
    @State private var filter: Filter = .all

    enum Filter: String, CaseIterable { case all = "すべて", todo = "未チェック", done = "チェック済み" }

    private var speed: ShadowingSpeed { ShadowingSpeed(rawValue: speedRaw) ?? .x10 }
    private var done: Set<String> { Set(doneRaw.split(separator: ",").map(String.init)) }

    private var items: [ShadowingItem] {
        switch filter {
        case .all:  return ShadowingSeed.all
        case .todo: return ShadowingSeed.all.filter { !done.contains($0.id) }
        case .done: return ShadowingSeed.all.filter { done.contains($0.id) }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            intro
            speedRow
            HStack(spacing: 8) {
                ForEach(Filter.allCases, id: \.self) { f in
                    SketchChip(title: f.rawValue, selected: filter == f) { filter = f }
                }
                Spacer()
                Text("チェック \(done.count) / \(ShadowingSeed.all.count)")
                    .font(LFont.heading(12)).foregroundStyle(Palette.text)
            }
            if items.isEmpty {
                Text(filter == .done ? "まだチェックした文はありません" : "すべてチェック済みです 🎉")
                    .font(LFont.body(14)).foregroundStyle(Palette.subText)
                    .frame(maxWidth: .infinity).sketchCard(padding: 18)
            }
            ForEach(items) { item in
                ShadowingCard(item: item,
                              number: (ShadowingSeed.all.firstIndex(of: item) ?? 0) + 1,
                              checked: done.contains(item.id),
                              speed: speed.rawValue,
                              onToggleCheck: { toggle(item.id) })
            }
        }
        .onDisappear { player.stop() }
    }

    private var intro: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("シャドウイング").font(LFont.heading(17)).foregroundStyle(Palette.text)
                .marker(Palette.markerBlue, height: 9, yOffset: 3)
            Text("音声のすぐ後ろを影のように追いかけて、同じリズム・同じ音で声に出す練習です。単語をタップすると、そこから再生します。最初はゆっくり、慣れたら1倍へ。")
                .font(LFont.body(13)).foregroundStyle(Palette.subText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 14)
    }

    private var speedRow: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("再生スピード").font(LFont.heading(13)).foregroundStyle(Palette.text)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(ShadowingSpeed.allCases) { s in
                        SketchChip(title: s.label, selected: speed == s) { setSpeed(s) }
                    }
                }
                .padding(.vertical, 3)
            }
        }
    }

    private func setSpeed(_ s: ShadowingSpeed) {
        speedRaw = s.rawValue
        // Changing speed mid-sentence restarts from the word being read.
        if let id = player.playingId, let item = ShadowingSeed.all.first(where: { $0.id == id }) {
            player.play(item, fromWord: player.currentWord ?? 0, speed: s.rawValue)
        }
    }

    private func toggle(_ id: String) {
        var set = done
        if set.contains(id) { set.remove(id) } else { set.insert(id) }
        doneRaw = set.sorted().joined(separator: ",")
    }
}

struct ShadowingCard: View {
    let item: ShadowingItem
    let number: Int
    let checked: Bool
    let speed: Double
    let onToggleCheck: () -> Void
    @ObservedObject private var player = ShadowingPlayer.shared

    private var isPlaying: Bool { player.playingId == item.id }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 10) {
                Button(action: onToggleCheck) { SketchCheckbox(checked: checked) }
                    .buttonStyle(.plain)
                    .accessibilityLabel(checked ? "チェックを外す" : "練習済みにする")
                Text(String(format: "%02d", number))
                    .font(LFont.title(18)).foregroundStyle(Palette.stageBlue)
                if !ShadowingPlayer.hasAudio(item) {
                    SketchTag(text: "音声準備中・iPhoneの声", fill: Palette.cream)
                }
                Spacer()
                Button {
                    if isPlaying { player.stop() } else { player.play(item, fromWord: 0, speed: speed) }
                } label: {
                    Image(systemName: isPlaying ? "stop.fill" : "play.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 38, height: 38)
                        .background(Circle().fill(isPlaying ? Palette.stageRed : Palette.green))
                        .overlay(Circle().stroke(Palette.ink, lineWidth: 1.3))
                }
                .buttonStyle(.plain)
                .accessibilityLabel(isPlaying ? "停止" : "最初から再生")
            }

            FlowLayout(spacing: 6) {
                ForEach(Array(item.words.enumerated()), id: \.offset) { i, w in
                    let lit = isPlaying && player.currentWord == i
                    Button { player.play(item, fromWord: i, speed: speed) } label: {
                        Text(w)
                            .font(LFont.heading(18))
                            .foregroundStyle(Palette.text)
                            .padding(.vertical, 4).padding(.horizontal, 6)
                            .background(lit ? Palette.markerYellow : Palette.paper)
                            .overlay(Rectangle().strokeBorder(Palette.ink.opacity(lit ? 0.8 : 0.2), lineWidth: lit ? 1.4 : 1))
                    }
                    .buttonStyle(.plain)
                }
            }

            Text("/\(item.ipa)/")
                .font(LFont.body(14)).foregroundStyle(Palette.green)
                .fixedSize(horizontal: false, vertical: true)
            Text(item.japanese)
                .font(LFont.body(13)).foregroundStyle(Palette.subText)
                .fixedSize(horizontal: false, vertical: true)

            VStack(alignment: .leading, spacing: 6) {
                Text("発音のコツ").font(LFont.heading(13)).foregroundStyle(Palette.text)
                ForEach(Array(item.tips.enumerated()), id: \.offset) { _, tip in
                    HStack(alignment: .firstTextBaseline, spacing: 6) {
                        Text("・").font(LFont.body(13)).foregroundStyle(Palette.green)
                        Text(tip).font(LFont.body(13)).foregroundStyle(Palette.text)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Palette.tagYellow.opacity(0.6))
            .overlay(Rectangle().strokeBorder(Palette.coinOrange.opacity(0.6), lineWidth: 1))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 14, emphasized: isPlaying)
    }
}
