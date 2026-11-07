import Foundation
import AVFoundation
import Combine

/// Background music: a quiet jazz trio in a café while rain falls outside
/// (bgm_rainy_cafe.m4a, a seamless 32-bar loop). Played through an
/// AVAudioEngine buffer so the loop has no gap, ducked while the speaker
/// buttons talk, paused in the background.
final class BGMManager: ObservableObject {
    static let shared = BGMManager()

    private let d = UserDefaults.standard
    @Published var isOn: Bool { didSet { d.set(isOn, forKey: "bgm.on"); apply() } }
    @Published var volume: Double { didSet { d.set(volume, forKey: "bgm.volume"); player.volume = Float(volume) * (ducked ? duckFactor : 1) } }

    private let engine = AVAudioEngine()
    private let player = AVAudioPlayerNode()
    private var buffer: AVAudioPCMBuffer?
    private var loadFailed = false
    private var ducked = false
    private let duckFactor: Float = 0.3

    private init() {
        isOn = d.object(forKey: "bgm.on") as? Bool ?? false
        volume = d.object(forKey: "bgm.volume") as? Double ?? 0.45
        NotificationCenter.default.addObserver(self, selector: #selector(interrupted(_:)),
                                               name: AVAudioSession.interruptionNotification, object: nil)
    }

    // MARK: - Public

    /// Call when the app becomes active (and once at launch).
    func resume() {
        if isOn && !player.isPlaying { play() }
    }

    /// Call when the app goes to the background.
    func pause() {
        if player.isPlaying { player.pause() }
        if engine.isRunning { engine.pause() }
    }

    func toggle() { isOn.toggle() }

    /// Lower the music while English is being read out.
    func duck(_ on: Bool) {
        ducked = on
        player.volume = Float(volume) * (on ? duckFactor : 1)
    }

    // MARK: - Internals

    private func apply() {
        if isOn { play() } else { stop() }
    }

    private func load() -> Bool {
        if buffer != nil { return true }
        if loadFailed { return false }
        guard let url = Bundle.main.url(forResource: "bgm_rainy_cafe", withExtension: "m4a"),
              let file = try? AVAudioFile(forReading: url),
              let buf = AVAudioPCMBuffer(pcmFormat: file.processingFormat, frameCapacity: AVAudioFrameCount(file.length)) else {
            loadFailed = true
            return false
        }
        do {
            try file.read(into: buf)
        } catch {
            loadFailed = true
            return false
        }
        buffer = buf
        engine.attach(player)
        engine.connect(player, to: engine.mainMixerNode, format: file.processingFormat)
        return true
    }

    private func play() {
        guard load(), let buffer else { return }
        do {
            if !engine.isRunning {
                engine.prepare()
                try engine.start()
            }
        } catch {
            return
        }
        player.volume = Float(volume) * (ducked ? duckFactor : 1)
        if !player.isPlaying {
            player.stop()
            player.scheduleBuffer(buffer, at: nil, options: [.loops])
            player.play()
        }
    }

    private func stop() {
        player.stop()
        if engine.isRunning { engine.stop() }
    }

    @objc private func interrupted(_ note: Notification) {
        guard let info = note.userInfo,
              let raw = info[AVAudioSessionInterruptionTypeKey] as? UInt,
              let type = AVAudioSession.InterruptionType(rawValue: raw) else { return }
        switch type {
        case .began:
            pause()
        case .ended:
            let opts = AVAudioSession.InterruptionOptions(rawValue: info[AVAudioSessionInterruptionOptionKey] as? UInt ?? 0)
            if opts.contains(.shouldResume) { DispatchQueue.main.async { self.resume() } }
        @unknown default:
            break
        }
    }
}
