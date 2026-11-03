import SwiftUI

/// 5. 発音
struct PronunciationView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    @Binding var path: NavigationPath
    @State private var group: SoundGroup = .vowels
    @State private var selected: SoundItem? = PronunciationSeed.vowels.first
    @State private var shownWords: [SoundWord] = []
    @State private var generating = false
    @State private var message: String? = nil
    private let shownCount = 5

    private var items: [SoundItem] { PronunciationSeed.items(in: group) }
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 10), count: 4)

    var body: some View {
        ZStack {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ScreenTopBar { path.removeLast() }
                    ScreenHeaderCard(title: "発音", tagline: "耳で聞いて、\n口でまねる。", image: "hdr_mic", markerColor: Palette.markerBlue)
                    HStack(spacing: 8) {
                        ForEach(SoundGroup.allCases) { g in
                            SketchChip(title: g.rawValue, selected: group == g) {
                                group = g
                                selected = PronunciationSeed.items(in: g).first
                                reshuffle()
                            }
                        }
                        Spacer()
                    }
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(items) { item in
                            tile(item)
                        }
                    }
                    if let note = PronunciationSeed.note[group] {
                        Text(note)
                            .font(LFont.caption(11)).foregroundStyle(Palette.subText)
                            .padding(.vertical, 4).padding(.horizontal, 10)
                            .background(Palette.paper.opacity(0.9))
                    }
                    if let s = selected { detailCard(s) }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
        .onAppear { if shownWords.isEmpty { reshuffle() } }
        .alert("単語を作れませんでした", isPresented: Binding(get: { message != nil }, set: { if !$0 { message = nil } })) {
            Button("OK", role: .cancel) {}
        } message: { Text(message ?? "") }
    }

    private func tile(_ item: SoundItem) -> some View {
        let isSel = selected == item
        return Button {
            selected = item
            reshuffle()
            SpeechManager.shared.speak(item.exampleWord)
        } label: {
            VStack(spacing: 3) {
                Text(item.symbol)
                    .font(.system(size: 24, weight: .heavy, design: .serif))
                    .foregroundStyle(Palette.text)
                    .lineLimit(1).minimumScaleFactor(0.6)
                Text(item.name).font(LFont.heading(11)).foregroundStyle(Palette.green)
                    .lineLimit(1).minimumScaleFactor(0.6)
                Text(item.exampleWord).font(LFont.heading(15)).foregroundStyle(Palette.text).padding(.top, 2)
                    .lineLimit(1).minimumScaleFactor(0.7)
                Text(item.exampleIPA).font(LFont.caption(10)).foregroundStyle(Palette.subText)
                    .lineLimit(1).minimumScaleFactor(0.7)
            }
            .frame(maxWidth: .infinity, minHeight: 92)
            .padding(.vertical, 8)
            .background(ZStack {
                Rectangle().fill(Palette.ink).offset(x: 2, y: 3)
                Rectangle().fill(Palette.paper)
                Rectangle().strokeBorder(Palette.ink, lineWidth: isSel ? 2.6 : 1.3)
            })
        }
        .buttonStyle(.plain)
    }

    private func detailCard(_ s: SoundItem) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .firstTextBaseline, spacing: 8) {
                Text(s.title).font(LFont.title(24)).foregroundStyle(Palette.text)
                Text(s.symbol).font(.system(size: 20, weight: .bold, design: .serif)).foregroundStyle(Palette.green)
                Spacer()
                SpeakerButton(text: s.exampleWord, size: 18)
            }
            Text(s.subtitle).font(LFont.body(13)).foregroundStyle(Palette.subText)
            Text("どうやって発音する？").font(LFont.heading(14)).foregroundStyle(Palette.text).padding(.top, 4)
            ForEach(Array(s.steps.enumerated()), id: \.offset) { i, step in
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(i < PronunciationSeed.stepLabels.count ? PronunciationSeed.stepLabels[i] : "\(i + 1).")
                        .font(LFont.heading(12)).foregroundStyle(i == 2 ? Palette.stageRed : Palette.green)
                        .frame(width: 44, alignment: .leading)
                    Text(step).font(LFont.body(14)).foregroundStyle(Palette.text)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            SketchDivider().padding(.vertical, 4)
            HStack {
                Text("この音の単語").font(LFont.heading(14)).foregroundStyle(Palette.text)
                Text("\(store.soundWords(for: s).count)語").font(LFont.caption(11)).foregroundStyle(Palette.faint)
                Spacer()
                Button { Task { await refresh(s) } } label: {
                    HStack(spacing: 5) {
                        if generating { ProgressView().controlSize(.mini) } else { Image(systemName: "arrow.clockwise") }
                        Text(generating ? "作成中…" : "入れ替える")
                    }
                    .font(LFont.caption(12)).foregroundStyle(Palette.text)
                    .padding(.vertical, 4).padding(.horizontal, 8)
                    .background(Palette.paper)
                    .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
                }
                .buttonStyle(.plain)
                .disabled(generating)
            }
            ForEach(shownWords) { ex in
                Button { SpeechManager.shared.speak(ex.word) } label: {
                    VStack(alignment: .leading, spacing: 2) {
                        HStack(spacing: 8) {
                            Text(ex.word).font(LFont.heading(16)).foregroundStyle(Palette.text)
                            if !ex.ipa.isEmpty {
                                Text(ex.ipaDisplay).font(LFont.body(13)).foregroundStyle(Palette.green)
                                    .lineLimit(1).minimumScaleFactor(0.7)
                            }
                            Image(systemName: "speaker.wave.2").font(.system(size: 11)).foregroundStyle(Palette.green)
                        }
                        if !ex.japanese.isEmpty {
                            Text(ex.japanese).font(LFont.caption(12)).foregroundStyle(Palette.subText).lineLimit(1)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .buttonStyle(.plain)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .sketchCard(padding: 18, emphasized: true)
    }

    // MARK: - words

    private var hasKey: Bool {
        !(KeychainHelper.get(settings.provider.keychainKey) ?? "").isEmpty
    }

    /// Shows a fresh random subset of the pool, avoiding the ones on screen.
    private func reshuffle() {
        guard let s = selected else { shownWords = []; return }
        let pool = store.soundWords(for: s)
        let current = Set(shownWords.map { $0.id })
        var fresh = pool.filter { !current.contains($0.id) }.shuffled()
        if fresh.count < shownCount { fresh += pool.filter { current.contains($0.id) }.shuffled() }
        shownWords = Array(fresh.prefix(shownCount))
    }

    /// ↻: with an API key, ask the AI for new words; otherwise rotate the pool.
    private func refresh(_ s: SoundItem) async {
        guard hasKey else { withAnimation { reshuffle() }; return }
        generating = true
        defer { generating = false }
        do {
            let words = try await AIService.generateSoundWords(for: s, existing: store.soundWords(for: s))
            store.addGeneratedSoundWords(words, for: s)
            withAnimation { shownWords = Array(words.prefix(shownCount)) }
            if words.count < shownCount { reshuffleFill() }
        } catch {
            message = error.localizedDescription
        }
    }

    private func reshuffleFill() {
        guard let s = selected else { return }
        let have = Set(shownWords.map { $0.id })
        let extra = store.soundWords(for: s).filter { !have.contains($0.id) }.shuffled()
        shownWords += extra.prefix(max(0, shownCount - shownWords.count))
    }
}
