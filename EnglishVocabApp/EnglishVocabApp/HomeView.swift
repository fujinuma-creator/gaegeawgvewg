import SwiftUI
import Speech
import AVFoundation

struct HomeView: View {
    @EnvironmentObject var store: WordStore
    @ObservedObject private var pronProgress = PronunciationProgress.shared

    @State private var showAllWords = false
    @State private var showReviewList = false
    @State private var showPronunciation = false
    @AppStorage(EnglishAccent.storageKey) private var accentRaw: String = EnglishAccent.default.rawValue

    private var accent: EnglishAccent {
        EnglishAccent(rawValue: accentRaw) ?? .default
    }

    var body: some View {
        ZStack {
            GeometricBackground()
                .ignoresSafeArea()

            VStack(spacing: 10) {
                Spacer(minLength: 0)
                titleRow
                Button {
                    showAllWords = true
                } label: {
                    statTile(label: "全単語数", number: store.totalCount, suffix: "語", tappable: true)
                }
                .buttonStyle(.plain)
                Button {
                    showReviewList = true
                } label: {
                    statTile(label: "復習リスト", number: store.reviewListWords.count, suffix: "語", tappable: true)
                }
                .buttonStyle(.plain)
                Button {
                    showPronunciation = true
                } label: {
                    pronunciationTile
                }
                .buttonStyle(.plain)
                accentTile
                Spacer(minLength: 0)
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .dynamicTypeSize(.medium)
        .sheet(isPresented: $showAllWords) {
            WordListSheet(filter: .all)
                .environmentObject(store)
        }
        .sheet(isPresented: $showReviewList) {
            WordListSheet(filter: .reviewList)
                .environmentObject(store)
        }
        .sheet(isPresented: $showPronunciation) {
            PronunciationView()
                .environmentObject(store)
        }
    }

    // MARK: - Pronunciation tile

    /// Entry to 発音学習: the phoneme chart, the listening quiz and the
    /// record-and-compare screen. The last line shows how many sounds are
    /// currently marked as weak.
    private var pronunciationTile: some View {
        VStack(spacing: 3) {
            HStack(spacing: 4) {
                Text("発音学習")
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.black.opacity(0.7))
                Image(systemName: "chevron.right")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundStyle(.black.opacity(0.45))
            }
            Text("発音記号 ・ 聞き分け ・ 録音")
                .font(.system(size: 17, weight: .black, design: .rounded))
                .foregroundStyle(.black)
            Text(pronProgress.weakTokens.isEmpty
                 ? "44の音を日本語のコツで"
                 : "苦手な音 \(pronProgress.weakTokens.count) 個")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.black.opacity(0.5))
        }
        .lineLimit(1)
        .minimumScaleFactor(0.7)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(tileBackground)
        .contentShape(Rectangle())
    }

    // MARK: - Accent picker

    /// Which English the speaker buttons use, app-wide. The second line shows
    /// the voice iOS will actually pick, so it's obvious when the
    /// Enhanced/Premium voice still needs downloading.
    private var accentTile: some View {
        Menu {
            ForEach(EnglishAccent.allCases) { a in
                Button {
                    accentRaw = a.rawValue
                } label: {
                    if a == accent {
                        Label("\(a.flag) \(a.label)", systemImage: "checkmark")
                    } else {
                        Text("\(a.flag) \(a.label)")
                    }
                }
            }
        } label: {
            VStack(spacing: 3) {
                HStack(spacing: 4) {
                    Text("音声の英語")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(.black.opacity(0.7))
                    Image(systemName: "chevron.up.chevron.down")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.black.opacity(0.45))
                }
                Text("\(accent.flag) \(accent.label)")
                    .font(.system(size: 17, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text(SpeechManager.shared.voiceDescription(for: accent))
                    .font(.system(size: 11, weight: .medium))
                    .foregroundStyle(.black.opacity(0.5))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(tileBackground)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Title

    private var titleRow: some View {
        VStack(spacing: 2) {
            Text("AI 英単語帳")
                .font(.system(size: 34, weight: .black, design: .rounded))
                .foregroundStyle(.black)
                .minimumScaleFactor(0.6)
                .lineLimit(1)
            Text("AI English Vocabulary")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.black.opacity(0.55))
                .tracking(2)
                .lineLimit(1)
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 18)
        .frame(maxWidth: .infinity)
        .background(tileBackground)
    }

    // MARK: - Tiles (centered, dark text on solid white card)

    private func statTile(label: String, number: Int, suffix: String, tappable: Bool = false) -> some View {
        VStack(spacing: 3) {
            HStack(spacing: 4) {
                Text(label)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(.black.opacity(0.7))
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                if tappable {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundStyle(.black.opacity(0.45))
                }
            }
            HStack(alignment: .lastTextBaseline, spacing: 4) {
                Text("\(number)")
                    .font(.system(size: 26, weight: .black, design: .rounded))
                    .foregroundStyle(.black)
                Text(suffix)
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundStyle(.black.opacity(0.55))
            }
            .lineLimit(1)
            .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(tileBackground)
        .contentShape(Rectangle())
    }

    /// Truly translucent card: a thin white wash so the math-paper and
    /// solar-system elements behind it are clearly visible through the
    /// surface, with a darker stroke and a small shadow keeping text
    /// edges legible.
    private var tileBackground: some View {
        RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.42))
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(Color.black.opacity(0.22), lineWidth: 0.8)
            )
            .shadow(color: .black.opacity(0.06), radius: 3, y: 1)
    }
}

#Preview {
    HomeView()
        .environmentObject(WordStore())
}

// MARK: - 発音学習 ────────────────────────────────────────────────────────────

/// A word shown on the pronunciation screens: the English spelling plus the
/// IPA and Japanese meaning when the word is in the vocabulary.
struct PronWord: Identifiable, Hashable {
    let english: String
    let ipa: String?
    let japanese: String?
    var id: String { english }

    /// IPA wrapped in exactly one pair of slashes.
    var ipaDisplay: String? {
        guard let ipa, !ipa.isEmpty else { return nil }
        let bare = ipa.trimmingCharacters(in: CharacterSet(charactersIn: "/ "))
        return "/\(bare)/"
    }
}

extension WordStore {
    /// Looks the word up in the vocabulary (case-insensitive) so the screens
    /// can show its IPA and meaning; falls back to the bare spelling.
    func pronWord(_ english: String) -> PronWord {
        let key = english.lowercased()
        if let w = words.first(where: { $0.word.lowercased() == key }) {
            return PronWord(english: w.word, ipa: w.ipa, japanese: w.definitionJapanese)
        }
        return PronWord(english: english, ipa: nil, japanese: nil)
    }

    /// Vocabulary words containing the phoneme, shortest first, topped up
    /// with the phoneme's built-in keywords when the vocabulary is thin.
    func pronExamples(for phoneme: Phoneme, limit: Int = 6) -> [PronWord] {
        var out: [PronWord] = []
        let matches = words
            .filter { w in
                guard let ipa = w.ipa else { return false }
                return IPATokenizer.tokens(ipa).contains(phoneme.token)
            }
            .sorted { a, b in
                let sa = a.word.contains(" "), sb = b.word.contains(" ")
                if sa != sb { return !sa }
                if a.word.count != b.word.count { return a.word.count < b.word.count }
                return a.word < b.word
            }
        for w in matches.prefix(limit) {
            out.append(PronWord(english: w.word, ipa: w.ipa, japanese: w.definitionJapanese))
        }
        if out.count < 4 {
            for k in phoneme.keywords where !out.contains(where: { $0.english.lowercased() == k.lowercased() }) {
                out.append(pronWord(k))
                if out.count >= limit { break }
            }
        }
        return out
    }
}

/// 苦手な音の記録. Miss / hit counts per phoneme token, kept in UserDefaults
/// so they survive relaunches.
final class PronunciationProgress: ObservableObject {
    static let shared = PronunciationProgress()

    private let missKey = "pron.miss"
    private let hitKey = "pron.hit"

    @Published private(set) var misses: [String: Int]
    @Published private(set) var hits: [String: Int]

    private init() {
        misses = UserDefaults.standard.dictionary(forKey: missKey) as? [String: Int] ?? [:]
        hits = UserDefaults.standard.dictionary(forKey: hitKey) as? [String: Int] ?? [:]
    }

    func recordMiss(_ token: String) {
        misses[token, default: 0] += 1
        save()
    }

    func recordHit(_ token: String) {
        hits[token, default: 0] += 1
        save()
    }

    func reset() {
        misses = [:]
        hits = [:]
        save()
    }

    private func save() {
        UserDefaults.standard.set(misses, forKey: missKey)
        UserDefaults.standard.set(hits, forKey: hitKey)
    }

    /// Every sound missed at least once, most-missed first.
    var weakTokens: [String] {
        misses
            .filter { $0.value > 0 }
            .sorted { a, b in
                if a.value != b.value { return a.value > b.value }
                return a.key < b.key
            }
            .map(\.key)
    }

    /// Marked 苦手 on the chart once it has been missed twice.
    func isWeak(_ token: String) -> Bool {
        (misses[token] ?? 0) >= 2
    }
}

// MARK: Root

struct PronunciationView: View {
    @EnvironmentObject var store: WordStore
    @ObservedObject private var progress = PronunciationProgress.shared
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 14) {
                    intro
                    weakSummary
                    NavigationLink {
                        PhonemeChartView()
                    } label: {
                        featureCard(icon: "textformat.abc", color: .indigo,
                                    title: "① 発音記号表",
                                    subtitle: "44の音を「口の形・コツ・注意点」で",
                                    detail: "母音12・二重母音8・子音24。単語帳の例と音声つき。")
                    }
                    NavigationLink {
                        MinimalPairQuizView()
                    } label: {
                        featureCard(icon: "ear.fill", color: .teal,
                                    title: "② 聞き分けクイズ",
                                    subtitle: "ship / sheep、light / right …",
                                    detail: "音を聞いてどちらの単語か選ぶ。間違えた音は自動で記録。")
                    }
                    NavigationLink {
                        RecordCompareView(initial: nil)
                    } label: {
                        featureCard(icon: "mic.fill", color: .pink,
                                    title: "③ 録音して比べる",
                                    subtitle: "お手本を聞いて、自分の声を認識させる",
                                    detail: "iPhone の音声認識が英語として聞き取れたかを確認。")
                    }
                }
                .padding(16)
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("発音学習")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("閉じる") { dismiss() }
                }
            }
        }
    }

    private var intro: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("英語には日本語にない音がたくさんあります。")
                .font(.system(size: 15, weight: .semibold))
            Text("① 音を知る → ② 聞き分ける → ③ 自分で出してみる、の順で練習すると身につきます。音声はホームで選んだ英語で再生されます。")
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
    }

    @ViewBuilder
    private var weakSummary: some View {
        NavigationLink {
            WeakSoundsView()
        } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundStyle(.orange)
                    Text("④ 苦手な音")
                        .font(.system(size: 15, weight: .bold))
                    Spacer()
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundStyle(.tertiary)
                }
                if progress.weakTokens.isEmpty {
                    Text("まだ記録はありません。聞き分けクイズや録音で間違えた音がここに集まります。")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                } else {
                    HStack(spacing: 8) {
                        ForEach(progress.weakTokens.prefix(5), id: \.self) { token in
                            if let p = PhonemeSeed.phoneme(token) {
                                VStack(spacing: 1) {
                                    Text("/\(p.symbol)/")
                                        .font(.system(size: 17, weight: .bold, design: .serif))
                                    Text("×\(progress.misses[token] ?? 0)")
                                        .font(.system(size: 10, weight: .semibold))
                                        .foregroundStyle(.red)
                                }
                                .frame(minWidth: 44)
                                .padding(.vertical, 6)
                                .background(Color.red.opacity(0.08), in: RoundedRectangle(cornerRadius: 8))
                            }
                        }
                        Spacer()
                    }
                }
            }
            .foregroundStyle(.primary)
            .padding(14)
            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
        }
        .buttonStyle(.plain)
    }

    private func featureCard(icon: String, color: Color, title: String, subtitle: String, detail: String) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 50, height: 50)
                .background(color, in: RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.primary)
                Text(subtitle)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.primary.opacity(0.8))
                Text(detail)
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            Spacer(minLength: 0)
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.tertiary)
        }
        .multilineTextAlignment(.leading)
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
    }
}

// MARK: ① 発音記号表

struct PhonemeChartView: View {
    @ObservedObject private var progress = PronunciationProgress.shared
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 4)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("タップすると口の形・コツ・注意点と、単語帳にある例の単語が見られます。赤い点は苦手な音です。")
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)

                ForEach(Phoneme.Group.allCases, id: \.self) { group in
                    let items = PhonemeSeed.all.filter { $0.group == group }
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .firstTextBaseline, spacing: 6) {
                            Text(group.rawValue)
                                .font(.system(size: 18, weight: .bold))
                            Text("\(items.count)音")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(.secondary)
                        }
                        Text(hint(for: group))
                            .font(.system(size: 12))
                            .foregroundStyle(.secondary)
                        LazyVGrid(columns: columns, spacing: 8) {
                            ForEach(items) { p in
                                NavigationLink {
                                    PhonemeDetailView(phoneme: p)
                                } label: {
                                    tile(p)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("発音記号表")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func hint(for group: Phoneme.Group) -> String {
        switch group {
        case .vowel:     return "口の開き方と長さがポイント。「ː」のつく音は本当に伸ばす。"
        case .diphthong: return "2つの音をなめらかにつなげる。最初の音を強く、後ろは軽く添える。"
        case .consonant: return "日本語にない th・f・v・l・r は、舌と唇の位置をはっきり意識する。"
        }
    }

    private func tile(_ p: Phoneme) -> some View {
        VStack(spacing: 2) {
            Text("/\(p.symbol)/")
                .font(.system(size: 21, weight: .bold, design: .serif))
                .foregroundStyle(.primary)
                .lineLimit(1)
                .minimumScaleFactor(0.6)
            Text(p.keyword)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .minimumScaleFactor(0.7)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 12))
        .overlay(alignment: .topTrailing) {
            if progress.isWeak(p.token) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 8, height: 8)
                    .padding(6)
            }
        }
    }
}

struct PhonemeDetailView: View {
    let phoneme: Phoneme
    @EnvironmentObject var store: WordStore
    @ObservedObject private var progress = PronunciationProgress.shared
    @State private var examples: [PronWord] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                header
                if let n = progress.misses[phoneme.token], n > 0 {
                    Label("聞き分けクイズ・録音で \(n) 回間違えています", systemImage: "exclamationmark.triangle.fill")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.orange)
                }
                adviceCard(icon: "mouth.fill", color: .indigo, title: "口の形・舌の位置", text: phoneme.mouth)
                adviceCard(icon: "lightbulb.fill", color: .teal, title: "コツ", text: phoneme.tip)
                adviceCard(icon: "exclamationmark.circle.fill", color: .orange, title: "日本人が間違えやすい点", text: phoneme.caution)
                exampleSection
                NavigationLink {
                    RecordCompareView(initial: examples.first ?? store.pronWord(phoneme.keyword))
                } label: {
                    Label("この音を録音して練習する", systemImage: "mic.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.pink, in: RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("/\(phoneme.symbol)/")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if examples.isEmpty {
                examples = store.pronExamples(for: phoneme)
            }
        }
    }

    private var header: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("/\(phoneme.symbol)/")
                .font(.system(size: 52, weight: .bold, design: .serif))
                .frame(minWidth: 96)
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
                .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 16))
            VStack(alignment: .leading, spacing: 5) {
                Text(phoneme.name)
                    .font(.system(size: 19, weight: .bold))
                Text(phoneme.group.rawValue)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.secondary)
                Button {
                    SpeechManager.shared.speak(phoneme.keyword)
                } label: {
                    Label(phoneme.keyword, systemImage: "speaker.wave.2.fill")
                        .font(.system(size: 15, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 12)
                        .background(Color.indigo, in: Capsule())
                }
                .buttonStyle(.plain)
            }
            Spacer(minLength: 0)
        }
    }

    private func adviceCard(icon: String, color: Color, title: String, text: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(color)
                .frame(width: 24)
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundStyle(color)
                Text(text)
                    .font(.system(size: 15))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
        .overlay(alignment: .leading) {
            RoundedRectangle(cornerRadius: 2)
                .fill(color)
                .frame(width: 4)
                .padding(.vertical, 10)
        }
    }

    private var exampleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("例の単語")
                .font(.system(size: 15, weight: .bold))
            Text("単語帳からこの音を含む単語を自動で集めました。タップで再生、2回目はゆっくり。")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
            VStack(spacing: 0) {
                ForEach(Array(examples.enumerated()), id: \.element.id) { i, w in
                    PronWordRow(word: w)
                    if i < examples.count - 1 {
                        Divider().padding(.leading, 56)
                    }
                }
            }
            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
        }
    }
}

/// One example word: speaker button, spelling, IPA and Japanese meaning.
struct PronWordRow: View {
    let word: PronWord

    var body: some View {
        HStack(spacing: 12) {
            Button {
                SpeechManager.shared.speak(word.english)
            } label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)
                    .frame(width: 34, height: 34)
                    .background(Color.indigo, in: Circle())
            }
            .buttonStyle(.plain)
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(word.english)
                        .font(.system(size: 17, weight: .bold))
                    if let ipa = word.ipaDisplay {
                        Text(ipa)
                            .font(.system(size: 13))
                            .foregroundStyle(.secondary)
                    }
                }
                if let ja = word.japanese, !ja.isEmpty {
                    Text(ja)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
    }
}

// MARK: ② 聞き分けクイズ

struct MinimalPairQuizView: View {
    @EnvironmentObject var store: WordStore
    @ObservedObject private var progress = PronunciationProgress.shared

    @State private var questions: [MinimalPair] = []
    @State private var index = 0
    @State private var targetIsA = true
    @State private var chosenA: Bool? = nil
    @State private var correctCount = 0
    @State private var missed: [MinimalPair] = []
    @State private var finished = false

    private let roundSize = 10

    var body: some View {
        Group {
            if finished {
                summary
            } else if let pair = current {
                question(pair)
            } else {
                ProgressView()
            }
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("聞き分けクイズ")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if questions.isEmpty { startRound() }
        }
        .onDisappear {
            SpeechManager.shared.stop()
        }
    }

    // MARK: Round control

    /// Pairs that involve a currently weak sound come first so practice goes
    /// where it is needed; the rest are random.
    private func startRound() {
        let shuffled = PhonemeSeed.pairs.shuffled()
        let weak = Set(progress.weakTokens)
        let prioritised = shuffled.filter { weak.contains($0.tokenA) || weak.contains($0.tokenB) }
        let rest = shuffled.filter { !(weak.contains($0.tokenA) || weak.contains($0.tokenB)) }
        questions = Array((prioritised + rest).prefix(roundSize))
        index = 0
        correctCount = 0
        missed = []
        finished = false
        prepareQuestion()
    }

    private func prepareQuestion() {
        targetIsA = Bool.random()
        chosenA = nil
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            playTarget(fresh: true)
        }
    }

    private var current: MinimalPair? {
        questions.indices.contains(index) ? questions[index] : nil
    }

    private func targetWord(_ pair: MinimalPair) -> String {
        targetIsA ? pair.a : pair.b
    }

    private func targetToken(_ pair: MinimalPair) -> String {
        targetIsA ? pair.tokenA : pair.tokenB
    }

    /// `fresh` forces normal speed (the auto-play when a question appears);
    /// a manual replay follows the usual 1× → 0.25× toggle.
    private func playTarget(fresh: Bool) {
        guard let pair = current else { return }
        if fresh { SpeechManager.shared.stop() }
        SpeechManager.shared.speak(targetWord(pair))
    }

    private func choose(a: Bool) {
        guard chosenA == nil, let pair = current else { return }
        chosenA = a
        if a == targetIsA {
            correctCount += 1
            progress.recordHit(targetToken(pair))
        } else {
            missed.append(pair)
            progress.recordMiss(targetToken(pair))
        }
    }

    private func next() {
        if index + 1 >= questions.count {
            finished = true
        } else {
            index += 1
            prepareQuestion()
        }
    }

    // MARK: Question screen

    private func question(_ pair: MinimalPair) -> some View {
        ScrollView {
            VStack(spacing: 18) {
                HStack {
                    Text("第 \(index + 1) / \(questions.count) 問")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(.secondary)
                    Spacer()
                    Text(pair.label)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundStyle(.indigo)
                }

                Text("音を聞いて、どちらの単語か選んでください")
                    .font(.system(size: 15, weight: .semibold))

                Button {
                    playTarget(fresh: false)
                } label: {
                    VStack(spacing: 6) {
                        Image(systemName: "speaker.wave.3.fill")
                            .font(.system(size: 34, weight: .bold))
                        Text("もう一度聞く")
                            .font(.system(size: 13, weight: .bold))
                        Text("2回目はゆっくり")
                            .font(.system(size: 11))
                            .opacity(0.8)
                    }
                    .foregroundStyle(.white)
                    .frame(width: 150, height: 110)
                    .background(Color.indigo, in: RoundedRectangle(cornerRadius: 18))
                }
                .buttonStyle(.plain)

                HStack(spacing: 12) {
                    choice(pair.a, isA: true, pair: pair)
                    choice(pair.b, isA: false, pair: pair)
                }

                if chosenA != nil {
                    feedback(pair)
                    Button {
                        next()
                    } label: {
                        Text(index + 1 >= questions.count ? "結果を見る" : "次へ")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 13)
                            .background(Color.indigo, in: RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(16)
        }
    }

    private func choice(_ word: String, isA: Bool, pair: MinimalPair) -> some View {
        let info = store.pronWord(word)
        let answered = chosenA != nil
        let isTarget = (isA == targetIsA)
        let isChosen = (chosenA == isA)
        let fill: Color = {
            guard answered else { return Color(.secondarySystemGroupedBackground) }
            if isTarget { return Color.green.opacity(0.18) }
            if isChosen { return Color.red.opacity(0.15) }
            return Color(.secondarySystemGroupedBackground)
        }()
        let stroke: Color = {
            guard answered else { return .clear }
            if isTarget { return .green }
            if isChosen { return .red }
            return .clear
        }()
        return Button {
            choose(a: isA)
        } label: {
            VStack(spacing: 4) {
                Text(word)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.primary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                if let ipa = info.ipaDisplay {
                    Text(ipa)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                } else {
                    Text("/\(isA ? pair.tokenA : pair.tokenB)/")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
                if let ja = info.japanese, !ja.isEmpty {
                    Text(ja)
                        .font(.system(size: 11))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 96)
            .background(fill, in: RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(stroke, lineWidth: 2))
        }
        .buttonStyle(.plain)
        .disabled(answered)
    }

    @ViewBuilder
    private func feedback(_ pair: MinimalPair) -> some View {
        let correct = (chosenA == targetIsA)
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 6) {
                Image(systemName: correct ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundStyle(correct ? .green : .red)
                Text(correct ? "正解！" : "不正解。流れていたのは「\(targetWord(pair))」")
                    .font(.system(size: 15, weight: .bold))
            }
            ForEach([pair.tokenA, pair.tokenB], id: \.self) { token in
                if let p = PhonemeSeed.phoneme(token) {
                    NavigationLink {
                        PhonemeDetailView(phoneme: p)
                    } label: {
                        HStack(alignment: .top, spacing: 10) {
                            Text("/\(p.symbol)/")
                                .font(.system(size: 18, weight: .bold, design: .serif))
                                .frame(minWidth: 44, alignment: .leading)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(p.name)
                                    .font(.system(size: 13, weight: .bold))
                                Text(p.tip)
                                    .font(.system(size: 12))
                                    .foregroundStyle(.secondary)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Spacer(minLength: 0)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 11, weight: .bold))
                                .foregroundStyle(.tertiary)
                        }
                        .foregroundStyle(.primary)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
    }

    // MARK: Summary

    private var summary: some View {
        ScrollView {
            VStack(spacing: 18) {
                VStack(spacing: 4) {
                    Text("\(correctCount) / \(questions.count)")
                        .font(.system(size: 44, weight: .black, design: .rounded))
                    Text(correctCount == questions.count ? "全問正解！" : "間違えた音は「苦手な音」に記録しました")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 10)

                if !missed.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("間違えた問題")
                            .font(.system(size: 15, weight: .bold))
                        ForEach(missed) { pair in
                            HStack {
                                Text("\(pair.a) / \(pair.b)")
                                    .font(.system(size: 16, weight: .semibold))
                                Spacer()
                                Text(pair.label)
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundStyle(.indigo)
                            }
                            .padding(12)
                            .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }

                Button {
                    startRound()
                } label: {
                    Text("もう一回")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 13)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 12))
                }
                .buttonStyle(.plain)
            }
            .padding(16)
        }
    }
}

// MARK: ③ 録音して比べる

/// Wraps SFSpeechRecognizer + AVAudioEngine for short, one-shot recordings.
/// Recognition runs on the device whenever the installed language supports
/// it; `onDevice` tells the UI which it was.
final class PronunciationRecognizer: ObservableObject {
    enum Phase: Equatable {
        case idle, requesting, recording, processing
    }

    @Published var phase: Phase = .idle
    @Published var transcript: String = ""
    @Published var finalTranscript: String? = nil
    @Published var onDevice: Bool = false
    @Published var errorMessage: String? = nil

    private var recognizer: SFSpeechRecognizer?
    private let audioEngine = AVAudioEngine()
    private var request: SFSpeechAudioBufferRecognitionRequest?
    private var task: SFSpeechRecognitionTask?
    private var autoStop: DispatchWorkItem?
    private var active = false

    /// Maximum length of one take.
    private let maxSeconds: Double = 4

    func toggle() {
        if phase == .recording { stop() } else if phase == .idle { start() }
    }

    func start() {
        errorMessage = nil
        transcript = ""
        finalTranscript = nil
        phase = .requesting
        SFSpeechRecognizer.requestAuthorization { auth in
            DispatchQueue.main.async {
                guard auth == .authorized else {
                    self.phase = .idle
                    self.errorMessage = "音声認識が許可されていません。設定 → プライバシーとセキュリティ → 音声認識 でこのアプリをオンにしてください。"
                    return
                }
                AVAudioApplication.requestRecordPermission { granted in
                    DispatchQueue.main.async {
                        guard granted else {
                            self.phase = .idle
                            self.errorMessage = "マイクが許可されていません。設定 → プライバシーとセキュリティ → マイク でこのアプリをオンにしてください。"
                            return
                        }
                        self.beginRecording()
                    }
                }
            }
        }
    }

    func stop() {
        autoStop?.cancel()
        guard phase == .recording else { return }
        phase = .processing
        audioEngine.stop()
        audioEngine.inputNode.removeTap(onBus: 0)
        request?.endAudio()
        // If the recogniser never sends a final result, settle with what we have.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
            guard let self, self.phase == .processing else { return }
            self.finalTranscript = self.transcript
            self.finish()
        }
    }

    private func beginRecording() {
        SpeechManager.shared.stop()
        guard let rec = Self.makeRecognizer(), rec.isAvailable else {
            phase = .idle
            errorMessage = "この端末では英語の音声認識が使えません。設定 → 一般 → キーボード → 音声入力 で英語を追加してください。"
            return
        }
        recognizer = rec

        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .measurement, options: [.duckOthers, .defaultToSpeaker])
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            phase = .idle
            errorMessage = "マイクを開始できませんでした。"
            SpeechManager.shared.configurePlaybackSession()
            return
        }

        let req = SFSpeechAudioBufferRecognitionRequest()
        req.shouldReportPartialResults = true
        req.taskHint = .dictation
        if rec.supportsOnDeviceRecognition {
            req.requiresOnDeviceRecognition = true
            onDevice = true
        } else {
            onDevice = false
        }
        request = req

        let input = audioEngine.inputNode
        let format = input.outputFormat(forBus: 0)
        input.removeTap(onBus: 0)
        input.installTap(onBus: 0, bufferSize: 1024, format: format) { buffer, _ in
            req.append(buffer)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
        } catch {
            input.removeTap(onBus: 0)
            phase = .idle
            errorMessage = "マイクを開始できませんでした。"
            SpeechManager.shared.configurePlaybackSession()
            return
        }

        active = true
        phase = .recording
        task = rec.recognitionTask(with: req) { [weak self] result, error in
            DispatchQueue.main.async {
                guard let self, self.active else { return }
                if let result {
                    self.transcript = result.bestTranscription.formattedString
                    if result.isFinal {
                        self.finalTranscript = self.transcript
                        self.finish()
                        return
                    }
                }
                if error != nil {
                    // "No speech detected" and friends: settle with the partial text.
                    self.finalTranscript = self.transcript
                    self.finish()
                }
            }
        }

        let work = DispatchWorkItem { [weak self] in self?.stop() }
        autoStop = work
        DispatchQueue.main.asyncAfter(deadline: .now() + maxSeconds, execute: work)
    }

    private func finish() {
        active = false
        autoStop?.cancel()
        task?.cancel()
        task = nil
        request = nil
        if audioEngine.isRunning {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
        }
        phase = .idle
        SpeechManager.shared.configurePlaybackSession()
    }

    /// Recogniser for the accent chosen on Home, falling back to British then
    /// American when that locale has no recogniser installed.
    private static func makeRecognizer() -> SFSpeechRecognizer? {
        var codes = EnglishAccent.current.languageCodes.filter {
            $0.contains("-") && !$0.lowercased().contains("scotland")
        }
        codes += ["en-GB", "en-US"]
        for code in codes {
            if let r = SFSpeechRecognizer(locale: Locale(identifier: code)), r.isAvailable {
                return r
            }
        }
        return SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
    }
}

struct RecordCompareView: View {
    @EnvironmentObject var store: WordStore
    @ObservedObject private var progress = PronunciationProgress.shared
    @StateObject private var recognizer = PronunciationRecognizer()

    @State private var target: PronWord?
    @State private var customText = ""
    @State private var lastVerdict: Verdict? = nil

    private let initial: PronWord?

    init(initial: PronWord?) {
        self.initial = initial
    }

    struct Verdict: Equatable {
        enum Kind: Equatable { case matched, mismatched, nothing }
        let kind: Kind
        let heard: String
        /// Tokens worth reviewing after a miss.
        let reviewTokens: [String]
        /// Specific hint when the misheard word is a known minimal pair.
        let pairLabel: String?
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                targetCard
                recordCard
                if let v = lastVerdict {
                    verdictCard(v)
                }
                note
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("録音して比べる")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            if target == nil {
                target = initial ?? randomTarget()
            }
        }
        .onDisappear {
            recognizer.stop()
            SpeechManager.shared.stop()
        }
        .onChange(of: recognizer.finalTranscript) { _, text in
            guard let text else { return }
            evaluate(text)
        }
    }

    // MARK: Target

    private func randomTarget() -> PronWord {
        let pool = PhonemeSeed.pairs.flatMap { [$0.a, $0.b] }
        return store.pronWord(pool.randomElement() ?? "right")
    }

    private var targetCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("お手本")
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.secondary)
            if let t = target {
                HStack(spacing: 14) {
                    Button {
                        SpeechManager.shared.speak(t.english)
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(Color.indigo, in: Circle())
                    }
                    .buttonStyle(.plain)
                    VStack(alignment: .leading, spacing: 3) {
                        Text(t.english)
                            .font(.system(size: 26, weight: .bold))
                            .lineLimit(2)
                            .minimumScaleFactor(0.6)
                        if let ipa = t.ipaDisplay {
                            Text(ipa)
                                .font(.system(size: 14))
                                .foregroundStyle(.secondary)
                        }
                        if let ja = t.japanese, !ja.isEmpty {
                            Text(ja)
                                .font(.system(size: 13))
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                    Spacer(minLength: 0)
                }
                if let ipa = t.ipa {
                    tokenChips(IPATokenizer.tokens(ipa))
                }
            }
            HStack(spacing: 8) {
                TextField("自分で単語や文を入力", text: $customText)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .font(.system(size: 15))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 10)
                    .background(Color(.tertiarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 10))
                    .onSubmit { applyCustom() }
                Button("決定") { applyCustom() }
                    .font(.system(size: 14, weight: .bold))
                    .disabled(customText.trimmingCharacters(in: .whitespaces).isEmpty)
                Button {
                    target = randomTarget()
                    lastVerdict = nil
                } label: {
                    Label("ランダム", systemImage: "shuffle")
                        .font(.system(size: 14, weight: .bold))
                }
            }
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
    }

    private func applyCustom() {
        let t = customText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !t.isEmpty else { return }
        target = store.pronWord(t)
        customText = ""
        lastVerdict = nil
    }

    /// The sounds in the target word, each linking to its chart page.
    private func tokenChips(_ tokens: [String]) -> some View {
        var seen = Set<String>()
        let unique = tokens.filter { seen.insert($0).inserted }
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(unique, id: \.self) { token in
                    if let p = PhonemeSeed.phoneme(token) {
                        NavigationLink {
                            PhonemeDetailView(phoneme: p)
                        } label: {
                            Text("/\(p.symbol)/")
                                .font(.system(size: 13, weight: .bold, design: .serif))
                                .foregroundStyle(progress.isWeak(token) ? .red : .primary)
                                .padding(.vertical, 5)
                                .padding(.horizontal, 9)
                                .background(
                                    (progress.isWeak(token) ? Color.red.opacity(0.1) : Color(.tertiarySystemGroupedBackground)),
                                    in: Capsule()
                                )
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
        }
    }

    // MARK: Recording

    private var recordCard: some View {
        VStack(spacing: 12) {
            Text("あなたの声")
                .font(.system(size: 13, weight: .bold))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)

            Button {
                lastVerdict = nil
                recognizer.toggle()
            } label: {
                ZStack {
                    Circle()
                        .fill(recognizer.phase == .recording ? Color.red : Color.pink)
                        .frame(width: 88, height: 88)
                        .shadow(color: (recognizer.phase == .recording ? Color.red : Color.pink).opacity(0.35), radius: 10, y: 4)
                    if recognizer.phase == .processing || recognizer.phase == .requesting {
                        ProgressView().tint(.white)
                    } else {
                        Image(systemName: recognizer.phase == .recording ? "stop.fill" : "mic.fill")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(.white)
                    }
                }
            }
            .buttonStyle(.plain)
            .disabled(recognizer.phase == .processing || recognizer.phase == .requesting)

            Text(statusText)
                .font(.system(size: 13, weight: .semibold))
                .foregroundStyle(recognizer.phase == .recording ? .red : .secondary)

            if recognizer.phase == .recording && !recognizer.transcript.isEmpty {
                Text(recognizer.transcript)
                    .font(.system(size: 17, weight: .semibold))
                    .multilineTextAlignment(.center)
            }

            if let e = recognizer.errorMessage {
                Text(e)
                    .font(.system(size: 12))
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
    }

    private var statusText: String {
        switch recognizer.phase {
        case .idle:       return "マイクを押して、お手本と同じように言ってみる（最長4秒）"
        case .requesting: return "許可を確認中…"
        case .recording:  return "録音中… もう一度押すと止まります"
        case .processing: return "聞き取り中…"
        }
    }

    // MARK: Verdict

    private static func normalize(_ s: String) -> String {
        let lowered = s.lowercased()
        let kept = lowered.unicodeScalars.map { scalar -> Character in
            if CharacterSet.letters.contains(scalar) || scalar == "'" { return Character(scalar) }
            return " "
        }
        return String(kept).split(separator: " ").joined(separator: " ")
    }

    private func evaluate(_ heardRaw: String) {
        guard let t = target else { return }
        let heard = Self.normalize(heardRaw)
        let want = Self.normalize(t.english)
        if heard.isEmpty {
            lastVerdict = Verdict(kind: .nothing, heard: "", reviewTokens: [], pairLabel: nil)
            return
        }
        let heardWords = Set(heard.split(separator: " ").map(String.init))
        let wantWords = want.split(separator: " ").map(String.init)
        let matched = heard == want || heard.contains(want) || wantWords.allSatisfy { heardWords.contains($0) }

        let targetTokens: [String] = {
            guard let ipa = t.ipa else { return [] }
            var seen = Set<String>()
            return IPATokenizer.tokens(ipa).filter { seen.insert($0).inserted }
        }()

        if matched {
            for token in targetTokens { progress.recordHit(token) }
            lastVerdict = Verdict(kind: .matched, heard: heardRaw, reviewTokens: [], pairLabel: nil)
            return
        }

        // A known minimal pair (said "light", heard "right") pins the blame
        // on one sound; otherwise offer every sound in the word for review.
        if let pair = PhonemeSeed.pairs.first(where: {
            ($0.a == want && $0.b == heard) || ($0.b == want && $0.a == heard)
        }) {
            let token = (pair.a == want) ? pair.tokenA : pair.tokenB
            progress.recordMiss(token)
            lastVerdict = Verdict(kind: .mismatched, heard: heardRaw, reviewTokens: [token], pairLabel: pair.label)
        } else {
            lastVerdict = Verdict(kind: .mismatched, heard: heardRaw, reviewTokens: targetTokens, pairLabel: nil)
        }
    }

    @ViewBuilder
    private func verdictCard(_ v: Verdict) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            switch v.kind {
            case .matched:
                Label("通じました！", systemImage: "checkmark.circle.fill")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.green)
                Text("「\(v.heard)」と認識されました。")
                    .font(.system(size: 14))
            case .mismatched:
                Label("別の言葉に聞こえました", systemImage: "xmark.circle.fill")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.red)
                Text("認識結果：「\(v.heard)」")
                    .font(.system(size: 14))
                if let label = v.pairLabel {
                    Text("ポイントは「\(label)」の違いです。苦手な音に記録しました。")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundStyle(.orange)
                } else {
                    Text("単語の音を一つずつ確認してみましょう。")
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                }
            case .nothing:
                Label("聞き取れませんでした", systemImage: "questionmark.circle.fill")
                    .font(.system(size: 17, weight: .bold))
                    .foregroundStyle(.orange)
                Text("マイクに近づいて、少し大きな声でもう一度どうぞ。")
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)
            }

            if !v.reviewTokens.isEmpty {
                VStack(spacing: 0) {
                    ForEach(v.reviewTokens, id: \.self) { token in
                        if let p = PhonemeSeed.phoneme(token) {
                            NavigationLink {
                                PhonemeDetailView(phoneme: p)
                            } label: {
                                HStack(alignment: .top, spacing: 10) {
                                    Text("/\(p.symbol)/")
                                        .font(.system(size: 18, weight: .bold, design: .serif))
                                        .frame(minWidth: 44, alignment: .leading)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(p.name)
                                            .font(.system(size: 13, weight: .bold))
                                        Text(p.tip)
                                            .font(.system(size: 12))
                                            .foregroundStyle(.secondary)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    Spacer(minLength: 0)
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 11, weight: .bold))
                                        .foregroundStyle(.tertiary)
                                }
                                .foregroundStyle(.primary)
                                .padding(.vertical, 8)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(14)
        .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))
    }

    private var note: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("しくみ")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(.secondary)
            Text("iPhone の音声認識が、あなたの発音を英語としてどう聞き取ったかを表示します。音ごとの採点ではなく「通じるかどうか」の目安です。" + (recognizer.onDevice ? "認識はこの端末の中で行われ、音声は外に送られません。" : "対応端末では認識は端末内で行われます。"))
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: ④ 苦手な音

struct WeakSoundsView: View {
    @ObservedObject private var progress = PronunciationProgress.shared
    @State private var confirmReset = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 14) {
                Text("聞き分けクイズと録音で間違えた音です。回数が多い順に並んでいます。タップすると口の形とコツが見られます。")
                    .font(.system(size: 13))
                    .foregroundStyle(.secondary)

                if progress.weakTokens.isEmpty {
                    VStack(spacing: 8) {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.system(size: 36))
                            .foregroundStyle(.green)
                        Text("まだ記録はありません")
                            .font(.system(size: 15, weight: .bold))
                        Text("聞き分けクイズをやってみましょう。")
                            .font(.system(size: 13))
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 30)
                } else {
                    VStack(spacing: 0) {
                        ForEach(Array(progress.weakTokens.enumerated()), id: \.element) { i, token in
                            if let p = PhonemeSeed.phoneme(token) {
                                NavigationLink {
                                    PhonemeDetailView(phoneme: p)
                                } label: {
                                    row(p, token: token)
                                }
                                .buttonStyle(.plain)
                                if i < progress.weakTokens.count - 1 {
                                    Divider().padding(.leading, 70)
                                }
                            }
                        }
                    }
                    .background(Color(.secondarySystemGroupedBackground), in: RoundedRectangle(cornerRadius: 14))

                    NavigationLink {
                        MinimalPairQuizView()
                    } label: {
                        Label("苦手な音を優先して聞き分けクイズ", systemImage: "ear.fill")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 13)
                            .background(Color.teal, in: RoundedRectangle(cornerRadius: 12))
                    }

                    Button(role: .destructive) {
                        confirmReset = true
                    } label: {
                        Text("記録をリセット")
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                    }
                }
            }
            .padding(16)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("苦手な音")
        .navigationBarTitleDisplayMode(.inline)
        .confirmationDialog("苦手な音の記録を消しますか？", isPresented: $confirmReset, titleVisibility: .visible) {
            Button("リセットする", role: .destructive) { progress.reset() }
            Button("キャンセル", role: .cancel) {}
        }
    }

    private func row(_ p: Phoneme, token: String) -> some View {
        let miss = progress.misses[token] ?? 0
        let hit = progress.hits[token] ?? 0
        return HStack(spacing: 12) {
            Text("/\(p.symbol)/")
                .font(.system(size: 22, weight: .bold, design: .serif))
                .frame(width: 58, alignment: .leading)
            VStack(alignment: .leading, spacing: 2) {
                Text(p.name)
                    .font(.system(size: 15, weight: .bold))
                Text("例：\(p.keyword)　　間違い \(miss) 回 ／ 正解 \(hit) 回")
                    .font(.system(size: 12))
                    .foregroundStyle(.secondary)
            }
            Spacer(minLength: 0)
            if progress.isWeak(token) {
                Text("苦手")
                    .font(.system(size: 11, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.vertical, 3)
                    .padding(.horizontal, 7)
                    .background(Color.red, in: Capsule())
            }
            Image(systemName: "chevron.right")
                .font(.system(size: 11, weight: .bold))
                .foregroundStyle(.tertiary)
        }
        .foregroundStyle(.primary)
        .padding(.vertical, 10)
        .padding(.horizontal, 12)
    }
}
