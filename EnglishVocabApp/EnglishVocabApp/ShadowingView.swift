import SwiftUI
import AVFoundation
import UniformTypeIdentifiers

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

/// One of the learner's own recordings that sentences can be practised against.
struct ShadowingSource: Identifiable {
    let key: String
    let label: String
    /// Length in seconds, used to recognise the file when it is imported.
    let duration: Double
    var id: String { key }
}

/// Where a sentence sits inside a recording (seconds from its start).
struct ShadowingClip {
    let source: String
    let start: Double
    let end: Double
    let wordStarts: [Double]
}

/// The learner's own audio files, imported on this device from Files.
/// They are copied into the app's Documents folder and stay there: nothing
/// is bundled with the app, uploaded or shared.
final class ShadowingSourceStore: ObservableObject {
    static let shared = ShadowingSourceStore()
    @Published private(set) var imported: [String: URL] = [:]

    private var folder: URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("ShadowingSources", isDirectory: true)
    }

    private init() { refresh() }

    func url(for key: String) -> URL? { imported[key] }

    private func refresh() {
        var found: [String: URL] = [:]
        let files = (try? FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil)) ?? []
        for f in files {
            let name = f.deletingPathExtension().lastPathComponent
            if name.hasPrefix("source_") { found[String(name.dropFirst("source_".count))] = f }
        }
        imported = found
    }

    /// Copies a picked file in and works out which recording it is from its
    /// length. Returns a message for the user.
    func importFile(_ picked: URL) -> String {
        let scoped = picked.startAccessingSecurityScopedResource()
        defer { if scoped { picked.stopAccessingSecurityScopedResource() } }
        guard let file = try? AVAudioFile(forReading: picked) else {
            return "「\(picked.lastPathComponent)」は音声ファイルとして開けませんでした。"
        }
        let seconds = Double(file.length) / file.processingFormat.sampleRate
        guard let source = ShadowingClips.sources.min(by: { abs($0.duration - seconds) < abs($1.duration - seconds) }),
              abs(source.duration - seconds) < 2.5 else {
            return "「\(picked.lastPathComponent)」（\(Int(seconds))秒）は、登録されている録音と長さが合いません。"
        }
        do {
            try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
            if let old = imported[source.key] { try? FileManager.default.removeItem(at: old) }
            let ext = picked.pathExtension.isEmpty ? "m4a" : picked.pathExtension
            let dest = folder.appendingPathComponent("source_\(source.key).\(ext)")
            try? FileManager.default.removeItem(at: dest)
            try FileManager.default.copyItem(at: picked, to: dest)
        } catch {
            return "取り込みに失敗しました。もう一度お試しください。"
        }
        refresh()
        return "\(source.label) を取り込みました。"
    }

    func remove(_ key: String) {
        if let u = imported[key] { try? FileManager.default.removeItem(at: u) }
        refresh()
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
/// word lengths. Only original recordings are played: there is no
/// synthesized-voice fallback.
final class ShadowingPlayer: NSObject, ObservableObject, @unchecked Sendable {
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

    private override init() {
        super.init()
        _ = SpeechManager.shared   // sets up the playback audio session
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

    /// The sentence's place in one of the learner's imported recordings.
    static func importedClip(for item: ShadowingItem) -> (url: URL, clip: ShadowingClip)? {
        guard let clip = ShadowingClips.all[item.id],
              let url = ShadowingSourceStore.shared.url(for: clip.source) else { return nil }
        return (url, clip)
    }

    static func hasAudio(_ item: ShadowingItem) -> Bool {
        audioURL(for: item) != nil || importedClip(for: item) != nil
    }

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
        if let url = Self.audioURL(for: item),
           playFile(url, item: item, segment: nil, times: nil, fromWord: start, speed: speed) {
            return
        }
        if let found = Self.importedClip(for: item),
           playFile(found.url, item: item, segment: (max(0, found.clip.start - 0.1), found.clip.end + 0.18),
                    times: found.clip.wordStarts, fromWord: start, speed: speed) {
            return
        }
        // No original audio available yet: nothing is played.
        stop()
    }

    func stop() {
        token += 1
        timer?.invalidate()
        timer = nil
        if node.isPlaying { node.stop() }
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

    /// `segment` limits playback to part of the file (start, end in seconds);
    /// `times` are the word start times inside the file when known.
    private func playFile(_ url: URL, item: ShadowingItem, segment: (TimeInterval, TimeInterval)?,
                          times: [TimeInterval]?, fromWord: Int, speed: Double) -> Bool {
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
        let segStart = max(0, segment?.0 ?? 0)
        let segEnd = min(duration, segment?.1 ?? duration)
        if let times, times.count == item.words.count {
            wordTimes = times
        } else {
            wordTimes = Self.timings(for: item, duration: duration)
        }
        let wordStart = wordTimes.indices.contains(fromWord) ? wordTimes[fromWord] : segStart
        let startTime = fromWord == 0 ? segStart : max(segStart, wordStart - 0.05)
        let startFrame = AVAudioFramePosition(startTime * sr)
        let endFrame = min(file.length, AVAudioFramePosition(segEnd * sr))
        guard startFrame < endFrame else { return false }
        let frames = AVAudioFrameCount(endFrame - startFrame)

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
}

// MARK: - Section shown in 発音 → シャドウイング

struct ShadowingSection: View {
    @ObservedObject private var player = ShadowingPlayer.shared
    @AppStorage("shadowing.done") private var doneRaw: String = ""
    @AppStorage("shadowing.shuffled") private var shuffled = false
    /// Changes every time シャッフル is pressed, so each press gives a new order.
    @AppStorage("shadowing.shuffleSalt") private var shuffleSalt = 0
    @State private var filter: Filter = .all
    @ObservedObject private var sources = ShadowingSourceStore.shared
    @State private var importing = false
    @State private var importMessage: String? = nil

    enum Filter: String, CaseIterable { case all = "すべて", todo = "未チェック", done = "チェック済み" }

    /// Checked passages that still exist (old ids from earlier lists are ignored).
    private var done: Set<String> {
        Set(doneRaw.split(separator: ",").map(String.init)).intersection(ShadowingSeed.all.map(\.id))
    }

    private var ordered: [ShadowingItem] {
        guard shuffled else { return ShadowingSeed.all }
        var rng = SplitMix64(seed: UInt64(bitPattern: Int64(shuffleSalt &* 7_919 &+ 101)))
        return ShadowingSeed.all.shuffled(using: &rng)
    }

    private var items: [ShadowingItem] {
        switch filter {
        case .all:  return ordered
        case .todo: return ordered.filter { !done.contains($0.id) }
        case .done: return ordered.filter { done.contains($0.id) }
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            intro
            // Only needed while some sentence has no bundled original audio.
            if !ShadowingSeed.all.allSatisfy({ ShadowingPlayer.audioURL(for: $0) != nil }) {
                ownAudioCard
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(Filter.allCases, id: \.self) { f in
                        SketchChip(title: f.rawValue, selected: filter == f) { filter = f }
                    }
                }
                .padding(.vertical, 3)
            }
            HStack(spacing: 8) {
                Button {
                    player.stop()
                    withAnimation(.easeInOut(duration: 0.25)) {
                        shuffleSalt &+= 1
                        shuffled = true
                    }
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "shuffle").font(.system(size: 12, weight: .bold))
                        Text("シャッフル")
                    }
                    .font(LFont.heading(13))
                    .foregroundStyle(shuffled ? .white : Palette.text)
                    .padding(.vertical, 6).padding(.horizontal, 12)
                    .background(ZStack {
                        Rectangle().fill(Palette.ink).offset(x: 2, y: 2)
                        Rectangle().fill(shuffled ? Palette.green : Palette.paper)
                        Rectangle().strokeBorder(Palette.ink, lineWidth: 1.2)
                    })
                }
                .buttonStyle(.plain)
                if shuffled {
                    SketchChip(title: "番号順に戻す") {
                        player.stop()
                        withAnimation(.easeInOut(duration: 0.25)) { shuffled = false }
                    }
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
                              onToggleCheck: { toggle(item.id) })
            }
        }
        .onDisappear { player.stop() }
        .fileImporter(isPresented: $importing, allowedContentTypes: [.audio], allowsMultipleSelection: true) { result in
            switch result {
            case .success(let urls):
                importMessage = urls.map { sources.importFile($0) }.joined(separator: "\n")
            case .failure:
                importMessage = "ファイルを開けませんでした。"
            }
        }
    }

    /// 自分の録音ファイルを取り込んで、原音で練習する（端末の中だけに保存）。
    private var ownAudioCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("自分の録音で練習する").font(LFont.heading(14)).foregroundStyle(Palette.text)
            Text("iPhone の「ファイル」にある自分の録音を取り込むと、対応する文を元の音声で再生します。音声はこの端末の中だけに保存され、アプリには含まれません。")
                .font(LFont.caption(11)).foregroundStyle(Palette.subText)
                .fixedSize(horizontal: false, vertical: true)
            ForEach(ShadowingClips.sources) { src in
                let count = ShadowingClips.all.values.filter { $0.source == src.key }.count
                HStack(spacing: 8) {
                    Image(systemName: sources.url(for: src.key) != nil ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(sources.url(for: src.key) != nil ? Palette.green : Palette.faint)
                    Text("\(src.label)・\(count)文").font(LFont.body(13)).foregroundStyle(Palette.text)
                    Spacer()
                    if sources.url(for: src.key) != nil {
                        Button { player.stop(); sources.remove(src.key) } label: {
                            Text("削除").font(LFont.caption(12)).foregroundStyle(Palette.stageRed)
                        }
                        .buttonStyle(.plain)
                    } else {
                        Text("未取り込み").font(LFont.caption(11)).foregroundStyle(Palette.faint)
                    }
                }
            }
            Button { importing = true } label: {
                HStack(spacing: 6) {
                    Image(systemName: "square.and.arrow.down").font(.system(size: 12, weight: .bold))
                    Text("音声ファイルを取り込む")
                }
            }
            .buttonStyle(OutlineButtonStyle(fullWidth: false))
            if let m = importMessage {
                Text(m).font(LFont.caption(12)).foregroundStyle(Palette.green)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 14)
    }

    private var intro: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("シャドウイング").font(LFont.heading(17)).foregroundStyle(Palette.text)
                .marker(Palette.markerBlue, height: 9, yOffset: 3)
            Text("音声のすぐ後ろを影のように追いかけて、同じリズム・同じ音で声に出す練習です。単語をタップすると、そこから再生します。速さは文ごとに選べます。最初はゆっくり、慣れたら1倍へ。")
                .font(LFont.body(13)).foregroundStyle(Palette.subText)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 14)
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
    let onToggleCheck: () -> Void
    @ObservedObject private var player = ShadowingPlayer.shared
    @ObservedObject private var sources = ShadowingSourceStore.shared
    /// This passage's own playback speed, remembered per passage.
    @AppStorage private var speed: Double

    init(item: ShadowingItem, number: Int, checked: Bool, onToggleCheck: @escaping () -> Void) {
        self.item = item
        self.number = number
        self.checked = checked
        self.onToggleCheck = onToggleCheck
        _speed = AppStorage(wrappedValue: 1.0, "shadowing.speed.\(item.id)")
    }

    private func setSpeed(_ s: ShadowingSpeed) {
        speed = s.rawValue
        // Changing speed mid-passage restarts from the word being read.
        if isPlaying { player.play(item, fromWord: player.currentWord ?? 0, speed: s.rawValue) }
    }

    private var speedRow: some View {
        HStack(spacing: 6) {
            Image(systemName: "gauge.with.dots.needle.33percent")
                .font(.system(size: 12, weight: .bold)).foregroundStyle(Palette.subText)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(ShadowingSpeed.allCases) { s in
                        let on = abs(speed - s.rawValue) < 0.001
                        Button { setSpeed(s) } label: {
                            Text(s.label)
                                .font(LFont.heading(12))
                                .foregroundStyle(on ? .white : Palette.text)
                                .padding(.vertical, 4).padding(.horizontal, 8)
                                .background(on ? Palette.green : Palette.paper)
                                .overlay(Rectangle().strokeBorder(Palette.ink.opacity(on ? 1 : 0.5), lineWidth: 1))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.vertical, 2)
            }
        }
    }

    private var isPlaying: Bool { player.playingId == item.id }

    /// True once the original recording for this sentence is on the device.
    private var canPlay: Bool {
        if ShadowingPlayer.audioURL(for: item) != nil { return true }
        guard let clip = ShadowingClips.all[item.id] else { return false }
        return sources.url(for: clip.source) != nil
    }

    private var audioTag: (String, Color) {
        canPlay ? ("原音", Palette.markerGreen) : ("録音を取り込むと再生できます", Palette.cream)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center, spacing: 10) {
                Button(action: onToggleCheck) { SketchCheckbox(checked: checked) }
                    .buttonStyle(.plain)
                    .accessibilityLabel(checked ? "チェックを外す" : "練習済みにする")
                Text(String(format: "%02d", number))
                    .font(LFont.title(18)).foregroundStyle(Palette.stageBlue)
                SketchTag(text: audioTag.0, fill: audioTag.1)
                Spacer()
                Button {
                    if isPlaying { player.stop() } else { player.play(item, fromWord: 0, speed: speed) }
                } label: {
                    Image(systemName: isPlaying ? "stop.fill" : "play.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(width: 38, height: 38)
                        .background(Circle().fill(isPlaying ? Palette.stageRed : (canPlay ? Palette.green : Palette.faint)))
                        .overlay(Circle().stroke(Palette.ink, lineWidth: 1.3))
                }
                .buttonStyle(.plain)
                .disabled(!canPlay)
                .accessibilityLabel(isPlaying ? "停止" : "最初から再生")
            }

            speedRow

            // Plain running text: each word is still tappable, and only the
            // word being read gets a marker highlight.
            FlowLayout(spacing: 2) {
                ForEach(Array(item.words.enumerated()), id: \.offset) { i, w in
                    let lit = isPlaying && player.currentWord == i
                    Button { player.play(item, fromWord: i, speed: speed) } label: {
                        Text(w)
                            .font(LFont.heading(18))
                            .foregroundStyle(Palette.text)
                            .padding(.vertical, 3).padding(.horizontal, 2)
                            .background(
                                RoundedRectangle(cornerRadius: 3)
                                    .fill(lit ? Palette.markerYellow : Color.clear)
                            )
                            .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                    .disabled(!canPlay)
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
