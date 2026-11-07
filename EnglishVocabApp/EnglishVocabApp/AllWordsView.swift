import SwiftUI

/// 2. 全単語
struct AllWordsView: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var purchases: PurchaseManager
    @State private var showPaywall = false
    @Binding var path: NavigationPath

    enum Filter: String, CaseIterable { case all = "すべて", checked = "チェック" }
    enum Sort: String, CaseIterable, Identifiable {
        case shuffled = "シャッフル", frequency = "会話頻度が高い順", newest = "新しく追加した順", nextReview = "次回の復習が近い順", mostReviewed = "学習回数が多い順", alphabetical = "ABC順"
        var id: String { rawValue }
    }

    @State private var query = ""
    @State private var filter: Filter = .all
    @AppStorage("allWords.sort") private var sortRaw: String = Sort.shuffled.rawValue
    /// Bumped by the 🔀 button to get a different order within the same day.
    @AppStorage("allWords.shuffleSalt") private var shuffleSalt: Int = 0
    private var sort: Sort {
        get { Sort(rawValue: sortRaw) ?? .shuffled }
        nonmutating set { sortRaw = newValue.rawValue }
    }
    @State private var expanded: Set<String> = []
    @State private var generating: Set<String> = []
    @State private var errorMessage: String?
    @State private var showAdd = false
    /// Shown once the list has been scrolled well past the header.
    @State private var showTopButton = false

    private var filtered: [Word] {
        var list = store.words
        if filter == .checked { list = list.filter { $0.checked } }
        let q = query.trimmingCharacters(in: .whitespaces)
        if !q.isEmpty {
            list = list.filter {
                $0.word.localizedCaseInsensitiveContains(q) || $0.japanese.contains(q)
                    || $0.definition.localizedCaseInsensitiveContains(q)
            }
        }
        switch sort {
        case .shuffled:
            // Same order all day; a new random order every day (and on 🔀).
            let day = Int(Date().startOfDay.timeIntervalSince1970 / 86_400)
            var rng = SplitMix64(seed: UInt64(bitPattern: Int64(day &* 1_000_003 &+ shuffleSalt)))
            list.sort { $0.id < $1.id }
            list.shuffle(using: &rng)
        case .newest:       list.sort { $0.createdAt > $1.createdAt }
        case .nextReview:   list.sort { $0.nextReviewDate < $1.nextReviewDate }
        case .mostReviewed: list.sort { $0.reviewCount > $1.reviewCount }
        case .alphabetical: list.sort { $0.word.lowercased() < $1.word.lowercased() }
        case .frequency:
            list.sort {
                let a = $0.frequency ?? 0, b = $1.frequency ?? 0
                if a != b { return a > b }
                return $0.word.lowercased() < $1.word.lowercased()
            }
        }
        return list
    }

    var body: some View {
        ScrollViewReader { proxy in
        ZStack(alignment: .bottomTrailing) {
            HatchBackground()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    ScrollOffsetMarker(space: "allWords")
                    ScreenTopBar { path.removeLast() }
                        .id("allWords.top")
                    ScreenHeaderCard(title: "全単語", tagline: "ひとつずつ、\n自分のことばに。", image: "hdr_book")
                    SketchSearchField(placeholder: "単語・意味・英語の定義で検索", text: $query)
                    HStack(spacing: 8) {
                        SketchChip(title: "すべて \(store.words.count)", selected: filter == .all) { filter = .all }
                        SketchChip(title: "チェック \(store.checkedWords.count)", selected: filter == .checked) { filter = .checked }
                        Spacer()
                        Button { if purchases.hasFullAccess { showAdd = true } else { showPaywall = true } } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "plus").font(.system(size: 12, weight: .heavy))
                                Text("単語を追加")
                            }
                        }
                        .buttonStyle(GreenButtonStyle(fullWidth: false))
                    }
                    HStack {
                        Text("\(filtered.count)件").font(LFont.body(13)).foregroundStyle(Palette.text)
                        Spacer()
                        Menu {
                            ForEach(Sort.allCases) { s in
                                Button { sort = s } label: {
                                    if s == sort { Label(s.rawValue, systemImage: "checkmark") } else { Text(s.rawValue) }
                                }
                            }
                        } label: {
                            HStack(spacing: 4) {
                                Text(sort.rawValue)
                                Image(systemName: "chevron.down").font(.system(size: 10, weight: .bold))
                            }
                            .font(LFont.body(13)).foregroundStyle(Palette.text)
                            .padding(.vertical, 5).padding(.horizontal, 10)
                            .background(Palette.paper)
                            .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
                        }
                        Button {
                            withAnimation(.easeInOut(duration: 0.25)) {
                                shuffleSalt &+= 1
                                sort = .shuffled
                            }
                        } label: {
                            Image(systemName: "shuffle")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(sort == .shuffled ? .white : Palette.text)
                                .padding(.vertical, 6).padding(.horizontal, 9)
                                .background(sort == .shuffled ? Palette.green : Palette.paper)
                                .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
                        }
                        .buttonStyle(.plain)
                        .accessibilityLabel("シャッフル")
                    }
                    Button {
                        if purchases.hasFullAccess {
                            let deck = FlashcardDeck(title: "今日の100語", wordIds: store.dailyWords().map { $0.id })
                            path.append(HomeView.Route.flashcards(deck))
                        } else {
                            showPaywall = true
                        }
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "sparkles").font(.system(size: 14, weight: .bold)).foregroundStyle(Palette.coinOrange)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("今日の100語").font(LFont.heading(15)).foregroundStyle(Palette.text)
                                Text("毎日ちがう100語をカードでざっと復習（日本語→英語も切替可）").font(LFont.caption(11)).foregroundStyle(Palette.subText)
                            }
                            Spacer()
                            Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold)).foregroundStyle(Palette.text)
                        }
                        .sketchCard(padding: 12)
                    }
                    .buttonStyle(.plain)
                    LazyVStack(spacing: 14) {
                        ForEach(filtered) { word in
                            WordRow(word: word,
                                    expanded: expanded.contains(word.id),
                                    generating: generating.contains(word.id),
                                    onToggleExpand: { toggle(word.id) },
                                    onToggleCheck: { store.toggleChecked(word) },
                                    onGenerate: { Task { await generate(word) } },
                                    locked: !purchases.hasFullAccess,
                                    onUnlock: { showPaywall = true })
                        }
                    }
                    if store.checkedWords.count > 0 {
                        Button {
                            if purchases.hasFullAccess {
                                let deck = FlashcardDeck(title: "全単語", wordIds: store.checkedWords.map { $0.id })
                                path.append(HomeView.Route.flashcards(deck))
                            } else {
                                showPaywall = true
                            }
                        } label: {
                            Text("チェックした\(store.checkedWords.count)語を復習する →")
                        }
                        .buttonStyle(GreenButtonStyle(fullWidth: false))
                        .padding(.top, 12)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                .padding(.bottom, 40)
            }
            .coordinateSpace(name: "allWords")
            .onPreferenceChange(ScrollOffsetKey.self) { y in
                let show = y < -700
                Task { @MainActor in
                    if show != showTopButton {
                        withAnimation(.easeInOut(duration: 0.2)) { showTopButton = show }
                    }
                }
            }

            if showTopButton {
                ScrollToTopButton {
                    withAnimation(.easeInOut(duration: 0.35)) { proxy.scrollTo("allWords.top", anchor: .top) }
                }
                .padding(.trailing, 18)
                .padding(.bottom, 26)
                .transition(.opacity.combined(with: .scale(scale: 0.8)))
            }
        }
        }
        .toolbar(.hidden, for: .navigationBar)
        .studyScreen()
        .sheet(isPresented: $showPaywall) {
            PaywallView().environmentObject(purchases)
        }
        .sheet(isPresented: $showAdd) {
            AddWordsSheet { sort = .newest; filter = .all }
                .environmentObject(store)
                .environmentObject(AppSettings.shared)
        }
        .alert("例文を作れませんでした", isPresented: Binding(get: { errorMessage != nil }, set: { if !$0 { errorMessage = nil } })) {
            Button("OK", role: .cancel) {}
        } message: { Text(errorMessage ?? "") }
    }

    private func toggle(_ id: String) {
        withAnimation(.easeInOut(duration: 0.2)) {
            if expanded.contains(id) { expanded.remove(id) } else { expanded.insert(id) }
        }
    }

    private func generate(_ word: Word) async {
        generating.insert(word.id)
        defer { generating.remove(word.id) }
        do {
            let examples = try await AIService.generateExamples(for: word)
            store.replaceExamples(for: word.id, with: examples, append: true)
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

/// One word card in 全単語 (collapsed / expanded).
struct WordRow: View {
    let word: Word
    let expanded: Bool
    let generating: Bool
    let onToggleExpand: () -> Void
    let onToggleCheck: () -> Void
    let onGenerate: () -> Void
    var locked: Bool = false
    var onUnlock: () -> Void = {}

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Button(action: onToggleCheck) { SketchCheckbox(checked: word.checked) }
                    .buttonStyle(.plain)
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text(word.word).font(LFont.word(24)).foregroundStyle(Palette.text)
                        if !word.ipa.isEmpty {
                            Text(word.ipaDisplay).font(LFont.heading(13)).foregroundStyle(Palette.green)
                                .lineLimit(1).minimumScaleFactor(0.7)
                        }
                        SpeakerButton(text: word.word)
                    }
                    Text(word.japanese).font(LFont.body(15)).foregroundStyle(Palette.text)
                    HStack(spacing: 6) {
                        if let f = word.frequency {
                            Text(String(repeating: "★", count: f) + String(repeating: "☆", count: 5 - f))
                                .font(LFont.caption(11)).foregroundStyle(Palette.coinOrange)
                        }
                        Text("学習 \(word.reviewCount)回 ・ 次回 \(word.nextReviewDate.shortJa)")
                            .font(LFont.caption(12)).foregroundStyle(Palette.faint)
                    }
                }
                Spacer()
                Image(systemName: expanded ? "chevron.up" : "chevron.down")
                    .font(.system(size: 14, weight: .bold)).foregroundStyle(Palette.subText)
            }
            .contentShape(Rectangle())
            .onTapGesture(perform: onToggleExpand)

            if expanded {
                SketchDivider()
                VStack(alignment: .leading, spacing: 12) {
                    if !word.definition.isEmpty {
                        HStack(alignment: .top, spacing: 6) {
                            SpeakerButton(text: word.definition)
                            VStack(alignment: .leading, spacing: 2) {
                                Text("英語の定義").font(LFont.caption(11)).foregroundStyle(Palette.faint)
                                Text(word.definition).font(LFont.body(15)).italic().foregroundStyle(Palette.text)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                    if !word.useCases.isEmpty {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("使う場面").font(LFont.caption(12)).foregroundStyle(Palette.subText)
                            ForEach(word.useCases, id: \.self) { uc in
                                Text(uc).font(LFont.body(14)).foregroundStyle(Palette.text).marker(Palette.markerBlue, height: 8, yOffset: 3)
                            }
                        }
                    }
                    HStack {
                        Text("例文").font(LFont.caption(12)).foregroundStyle(Palette.subText)
                        Spacer()
                        Button(action: onGenerate) {
                            HStack(spacing: 4) {
                                if generating { ProgressView().controlSize(.mini) } else { Image(systemName: "plus") }
                                Text(generating ? "作成中…" : "新しい例文を生成")
                            }
                            .font(LFont.caption(12)).foregroundStyle(Palette.text)
                            .padding(.vertical, 4).padding(.horizontal, 8)
                            .background(Palette.paper)
                            .overlay(Rectangle().strokeBorder(Palette.ink, lineWidth: 1))
                        }
                        .buttonStyle(.plain)
                        .disabled(generating)
                    }
                    ForEach(word.examples) { ex in
                        ExampleLine(example: ex)
                    }
                    if !word.related.isEmpty {
                        Text("関連表現").font(LFont.caption(12)).foregroundStyle(Palette.subText)
                        ForEach(word.related) { r in
                            HStack(alignment: .firstTextBaseline, spacing: 6) {
                                SpeakerButton(text: r.english, size: 12)
                                Text(r.english).font(LFont.heading(14)).foregroundStyle(Palette.text)
                                if !r.ipa.isEmpty {
                                    Text(r.ipaDisplay).font(LFont.caption(11)).foregroundStyle(Palette.green)
                                }
                                Text(r.japanese).font(LFont.caption(12)).foregroundStyle(Palette.subText)
                            }
                        }
                    }
                }
                .padding(.leading, 2)
                // 無料体験が終わったら詳細はモザイク
                .blur(radius: locked ? 7 : 0)
                .allowsHitTesting(!locked)
                .overlay { if locked { LockBadge(action: onUnlock) } }
            }
        }
        .sketchCard(padding: 14)
    }
}

/// 🔊 英語 / 発音記号 / 日本語 の3行表示.
struct ExampleLine: View {
    let example: Example
    var size: CGFloat = 15
    var body: some View {
        HStack(alignment: .top, spacing: 6) {
            SpeakerButton(text: example.english, size: 12)
            VStack(alignment: .leading, spacing: 2) {
                Text(example.english).font(LFont.heading(size)).foregroundStyle(Palette.text)
                    .fixedSize(horizontal: false, vertical: true)
                if !example.ipa.isEmpty {
                    Text(example.ipaDisplay).font(LFont.caption(11)).foregroundStyle(Palette.green)
                        .fixedSize(horizontal: false, vertical: true)
                }
                Text(example.japanese).font(LFont.caption(12)).foregroundStyle(Palette.subText)
            }
        }
    }
}


/// Small deterministic RNG so the shuffled order is stable for the day.
struct SplitMix64: RandomNumberGenerator {
    private var state: UInt64
    init(seed: UInt64) { state = seed == 0 ? 0x9E3779B97F4A7C15 : seed }
    mutating func next() -> UInt64 {
        state &+= 0x9E3779B97F4A7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58476D1CE4E5B9
        z = (z ^ (z >> 27)) &* 0x94D049BB133111EB
        return z ^ (z >> 31)
    }
}


// MARK: - 単語の追加（AIで自動作成）

/// Paste or type words — one per line, or separated by spaces / 、 / , —
/// and the selected AI fills in Jyutping, meaning, examples etc.
struct AddWordsSheet: View {
    @EnvironmentObject var store: WordStore
    @EnvironmentObject var settings: AppSettings
    @Environment(\.dismiss) private var dismiss
    var onFinished: () -> Void = {}

    enum ItemState: Equatable { case waiting, working, added(String), duplicate, failed(String) }
    struct Item: Identifiable { let id = UUID(); let input: String; var state: ItemState = .waiting }

    @State private var text = ""
    @State private var items: [Item] = []
    @State private var running = false
    @FocusState private var focused: Bool
    private let maxPerRun = 30

    /// Splits on new lines, spaces (half / full width), 、 , ， ; ／ /
    static func split(_ text: String) -> [String] {
        let seps = CharacterSet(charactersIn: "\n\r\t 　、,，;；／/・")
        var seen = Set<String>()
        return text.components(separatedBy: seps)
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty && seen.insert($0).inserted }
    }

    private var parsed: [String] { Self.split(text) }
    private var hasKey: Bool { !(KeychainHelper.get(settings.provider.keychainKey) ?? "").isEmpty }
    private var addedCount: Int { items.filter { if case .added = $0.state { return true }; return false }.count }

    var body: some View {
        NavigationStack {
            ZStack {
                HatchBackground()
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("単語を追加").font(LFont.title(24)).foregroundStyle(Palette.text)
                                .marker(Palette.markerGreen, height: 10, yOffset: 4)
                            Text("覚えたい単語を書いてください（英語・日本語どちらでもOK）。\n1行に1つ、または「、」で区切ると、AIが意味と例文を作って追加します。")
                                .font(LFont.body(13)).foregroundStyle(Palette.subText)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        ZStack(alignment: .topLeading) {
                            if text.isEmpty {
                                Text("例）\nput off\nlook up to\nおいしい、高い、地下鉄")
                                    .font(LFont.body(16)).foregroundStyle(Palette.faint)
                                    .padding(.horizontal, 5).padding(.vertical, 8)
                            }
                            TextEditor(text: $text)
                                .font(LFont.body(16))
                                .foregroundStyle(Palette.text)
                                .scrollContentBackground(.hidden)
                                .focused($focused)
                                .frame(minHeight: 160)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .disabled(running)
                        }
                        .sketchCard(padding: 10)

                        HStack {
                            Text("\(parsed.count)語" + (parsed.count > maxPerRun ? "（1回 \(maxPerRun)語まで）" : ""))
                                .font(LFont.heading(13)).foregroundStyle(Palette.text)
                            Spacer()
                            Button {
                                focused = false
                                Task { await run() }
                            } label: {
                                HStack(spacing: 6) {
                                    if running { ProgressView().tint(.white).controlSize(.small) }
                                    Text(running ? "作成中… \(progressText)" : "AIで作成して追加 →")
                                }
                            }
                            .buttonStyle(GreenButtonStyle(fullWidth: false))
                            .disabled(running || parsed.isEmpty || !hasKey)
                        }
                        if !hasKey {
                            Text("先に 設定 → 例文の作成（AI）で APIキーを保存してください。")
                                .font(LFont.caption(12)).foregroundStyle(Palette.stageRed)
                        }
                        if !items.isEmpty { resultList }
                    }
                    .padding(16)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(running ? "中止" : "閉じる") {
                        if running { running = false } else { finish() }
                    }
                }
            }
        }
        .onAppear { focused = true }
        .interactiveDismissDisabled(running)
    }

    private var progressText: String {
        let done = items.filter { $0.state != .waiting && $0.state != .working }.count
        return "\(done)/\(items.count)"
    }

    private var resultList: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(items) { item in
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    switch item.state {
                    case .waiting:
                        Image(systemName: "circle").foregroundStyle(Palette.faint)
                        Text(item.input).foregroundStyle(Palette.subText)
                    case .working:
                        ProgressView().controlSize(.mini)
                        Text(item.input).foregroundStyle(Palette.text)
                    case .added(let word):
                        Image(systemName: "checkmark.circle.fill").foregroundStyle(Palette.green)
                        Text(item.input == word ? word : "\(item.input) → \(word)").foregroundStyle(Palette.text)
                    case .duplicate:
                        Image(systemName: "equal.circle").foregroundStyle(Palette.stageYellow)
                        Text("\(item.input)（すでに登録済み）").foregroundStyle(Palette.subText)
                    case .failed(let msg):
                        Image(systemName: "xmark.circle.fill").foregroundStyle(Palette.stageRed)
                        VStack(alignment: .leading, spacing: 2) {
                            Text(item.input).foregroundStyle(Palette.text)
                            Text(msg).font(LFont.caption(11)).foregroundStyle(Palette.stageRed)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    Spacer(minLength: 0)
                }
                .font(LFont.body(14))
            }
            if !running && addedCount > 0 {
                Button { finish() } label: { Text("\(addedCount)語を追加しました。全単語で見る →") }
                    .buttonStyle(GreenButtonStyle())
                    .padding(.top, 6)
            }
        }
        .sketchCard(padding: 14)
    }

    private func finish() {
        if addedCount > 0 { onFinished() }
        dismiss()
    }

    private func run() async {
        let inputs = Array(parsed.prefix(maxPerRun))
        items = inputs.map { Item(input: $0) }
        running = true
        defer { running = false }
        for i in items.indices {
            guard running else { break }
            if store.contains(word: items[i].input) { items[i].state = .duplicate; continue }
            items[i].state = .working
            do {
                let w = try await AIService.generateWord(from: items[i].input)
                items[i].state = store.addUserWord(w) ? .added(w.word) : .duplicate
            } catch {
                items[i].state = .failed(error.localizedDescription)
                // Wrong key / quota: no point trying the rest.
                if let e = error as? AIServiceError {
                    if case .http(let code, _) = e, [401, 403, 429].contains(code) { break }
                    if case .missingKey = e { break }
                }
            }
        }
        // Whatever is left (after 中止 / fatal error) stays as "waiting".
        let left = items.filter { $0.state == .waiting }.map { $0.input }
        text = left.joined(separator: "\n")
    }
}
