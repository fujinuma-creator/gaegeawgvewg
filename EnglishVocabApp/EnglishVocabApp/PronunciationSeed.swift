import Foundation

/// 発音画面のデータ。イギリス英語の 44 音（母音 12・二重母音 8・子音 24）を
/// タイルで示し、選んだ音の出し方を日本語のコツで説明する。音ごとの単語は
/// 単語帳の発音記号から自動で集める。
enum PronunciationSeed {

    static func items(in group: SoundGroup) -> [SoundItem] {
        switch group {
        case .vowels:     return vowels
        case .diphthongs: return diphthongs
        case .consonants: return consonants
        }
    }

    static let note: [SoundGroup: String] = [
        .vowels:     "母音は12個。口の開き方と長さがポイント。「ː」のつく音は本当に伸ばす",
        .diphthongs: "二重母音は2つの音をなめらかにつなげる。最初の音を強く、後ろは軽く添える",
        .consonants: "子音は24個。日本語にない th・f・v・l・r は舌と唇の位置をはっきり意識する"
    ]

    /// Labels shown in front of the three steps (口の形 / コツ / 注意点).
    static let stepLabels = ["口の形", "コツ", "注意点"]

    static let vowels: [SoundItem] = PhonemeSeed.all.filter { $0.group == .vowel }.map(item)
    static let diphthongs: [SoundItem] = PhonemeSeed.all.filter { $0.group == .diphthong }.map(item)
    static let consonants: [SoundItem] = PhonemeSeed.all.filter { $0.group == .consonant }.map(item)

    static let all: [SoundItem] = vowels + diphthongs + consonants

    static func item(for id: String) -> SoundItem? { all.first { $0.id == id } }

    private static func item(_ p: Phoneme) -> SoundItem {
        let group: SoundGroup
        switch p.group {
        case .vowel:     group = .vowels
        case .diphthong: group = .diphthongs
        case .consonant: group = .consonants
        }
        let keyword = SeedWords.byWord[p.keyword.lowercased()]
        let more: [SoundWord] = p.keywords.map { k in
            if let w = SeedWords.byWord[k.lowercased()] {
                return SoundWord(word: w.word, ipa: w.ipa, japanese: w.japanese)
            }
            return SoundWord(word: k, ipa: "", japanese: "")
        }
        return SoundItem(
            id: p.token,
            group: group,
            symbol: "/\(p.symbol)/",
            name: p.name,
            exampleWord: p.keyword,
            exampleIPA: keyword?.ipaDisplay ?? "",
            exampleJapanese: keyword?.japanese ?? "",
            title: p.name,
            subtitle: "例：\(p.keyword)　/\(p.symbol)/ の音",
            steps: [p.mouth, p.tip, p.caution],
            moreExamples: more
        )
    }

    // MARK: - 語彙から音ごとのプールを作る

    /// True if the IPA string contains the sound.
    static func matches(_ ipa: String, soundId: String) -> Bool {
        IPATokenizer.tokens(ipa).contains(soundId)
    }

    /// All words for every sound, built once from the vocabulary. Shorter
    /// words first so the examples stay easy to hear.
    static let pools: [String: [SoundWord]] = {
        var pools: [String: [SoundWord]] = [:]
        let sorted = SeedWords.all
            .filter { !$0.ipa.isEmpty }
            .sorted { a, b in
                let sa = a.word.contains(" "), sb = b.word.contains(" ")
                if sa != sb { return !sa }
                if a.word.count != b.word.count { return a.word.count < b.word.count }
                return a.word < b.word
            }
        for w in sorted {
            var ids = Set<String>()
            for t in IPATokenizer.tokens(w.ipa) { ids.insert(t) }
            let sw = SoundWord(word: w.word, ipa: w.ipa, japanese: w.japanese)
            for id in ids { pools[id, default: []].append(sw) }
        }
        return pools
    }()
}
