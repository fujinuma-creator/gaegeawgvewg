import SwiftUI

// MARK: - Example study plan

/// One example sentence, addressed by the word that owns it plus the slot
/// index of the example inside that word.
///
/// This is deliberately *not* `ExampleSentence.id`: that UUID is excluded
/// from `ExampleSentence.CodingKeys`, so it is regenerated every time
/// words.json is decoded and cannot be used as a stable key. A
/// (wordId, index) pair is persisted on both sides and stays valid.
struct ExampleRef: Identifiable, Hashable {
    let wordId: UUID
    let exampleIdx: Int
    var id: String { "\(wordId.uuidString)#\(exampleIdx)" }
}

/// Splits every example sentence in the library into fixed "Day" batches of
/// 60 sentences. A given Day always holds the same sentences, because the
/// order is derived from the stable order of `WordStore.words`. The Day the
/// quiz serves advances by one every calendar day (Day 1 → Day 2 → Day 3 …)
/// and wraps back to Day 1 after the final Day.
enum ExamplePlan {
    /// How many example sentences make up one Day.
    static let sentencesPerDay = 60

    private static let anchorKey = "examplePlan.anchorDay"

    /// Total number of example sentences in the library.
    static func totalCount(in words: [Word]) -> Int {
        words.reduce(0) { $0 + $1.examples.count }
    }

    /// Total number of Days the library is split into.
    static func dayCount(in words: [Word]) -> Int {
        dayCount(totalSentences: totalCount(in: words))
    }

    static func dayCount(totalSentences: Int) -> Int {
        guard totalSentences > 0 else { return 0 }
        return (totalSentences + sentencesPerDay - 1) / sentencesPerDay
    }

    /// How many sentences Day `day` holds (the last Day may be short).
    static func count(forDay day: Int, totalSentences: Int) -> Int {
        let start = (day - 1) * sentencesPerDay
        guard start < totalSentences else { return 0 }
        return min(sentencesPerDay, totalSentences - start)
    }

    /// The (word, example index) pairs belonging to `day` (1-based).
    ///
    /// Walks `words` once and collects only the slice it needs, so this stays
    /// cheap enough to call from a SwiftUI body even with thousands of words.
    static func pairs(forDay day: Int, in words: [Word]) -> [(word: Word, exampleIdx: Int)] {
        guard day >= 1 else { return [] }
        let start = (day - 1) * sentencesPerDay
        let end = start + sentencesPerDay
        var result: [(word: Word, exampleIdx: Int)] = []
        result.reserveCapacity(sentencesPerDay)
        var running = 0
        for w in words {
            let c = w.examples.count
            if c == 0 { continue }
            if running + c <= start {       // entirely before the window
                running += c
                continue
            }
            if running >= end { break }     // past the window
            for i in 0..<c where (running + i) >= start && (running + i) < end {
                result.append((word: w, exampleIdx: i))
            }
            running += c
        }
        return result
    }

    /// Records "today" as Day 1 the first time the app runs. Called once from
    /// `WordStore.init` so that reading `currentDay` stays side-effect free.
    static func ensureAnchor(date: Date = Date()) {
        let defaults = UserDefaults.standard
        if defaults.double(forKey: anchorKey) == 0 {
            let start = Calendar.current.startOfDay(for: date).timeIntervalSince1970
            defaults.set(start, forKey: anchorKey)
        }
    }

    /// The Day to study today (1-based). Advances by one per calendar day.
    static func currentDay(in words: [Word], date: Date = Date()) -> Int {
        currentDay(totalDays: dayCount(in: words), date: date)
    }

    static func currentDay(totalDays: Int, date: Date = Date()) -> Int {
        guard totalDays > 0 else { return 1 }
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: date)
        let stored = UserDefaults.standard.double(forKey: anchorKey)
        let anchor = stored == 0
            ? today
            : calendar.startOfDay(for: Date(timeIntervalSince1970: stored))
        let elapsed = calendar.dateComponents([.day], from: anchor, to: today).day ?? 0
        // Wrap around so the plan repeats once every Day has been covered.
        let offset = ((elapsed % totalDays) + totalDays) % totalDays
        return offset + 1
    }
}

// MARK: - Example list (Day 1, Day 2, …)

/// Lists the study plan as Day 1, Day 2, Day 3 … Tapping a Day opens the 60
/// example sentences that belong to it.
struct ExampleListView: View {
    @EnvironmentObject var store: WordStore

    var body: some View {
        NavigationStack {
            let words = store.words
            let totalSentences = ExamplePlan.totalCount(in: words)
            let totalDays = ExamplePlan.dayCount(totalSentences: totalSentences)
            let today = ExamplePlan.currentDay(totalDays: totalDays)

            Group {
                if totalDays == 0 {
                    emptyView
                } else {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(1...totalDays, id: \.self) { day in
                                NavigationLink(value: day) {
                                    dayRow(
                                        day: day,
                                        isToday: day == today,
                                        count: ExamplePlan.count(
                                            forDay: day,
                                            totalSentences: totalSentences
                                        )
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                    }
                    .navigationDestination(for: Int.self) { day in
                        ExampleDayView(day: day)
                            .environmentObject(store)
                    }
                }
            }
        }
    }

    private var emptyView: some View {
        VStack(spacing: 10) {
            Image(systemName: "text.book.closed")
                .font(.system(size: 50))
                .foregroundStyle(.indigo)
            Text("例文がまだありません")
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }

    private func dayRow(day: Int, isToday: Bool, count: Int) -> some View {
        HStack(spacing: 12) {
            Text("\(day)")
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundStyle(isToday ? .white : .indigo)
                .frame(width: 42, height: 42)
                .background(
                    Circle().fill(isToday ? Color.indigo : Color.indigo.opacity(0.12))
                )
            VStack(alignment: .leading, spacing: 2) {
                HStack(spacing: 6) {
                    Text("Day \(day)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                    if isToday {
                        Text("本日")
                            .font(.caption2.bold())
                            .foregroundStyle(.white)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 2)
                            .background(Capsule().fill(Color.indigo))
                    }
                }
                Text("\(count) 文")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundStyle(.tertiary)
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(isToday ? 0.95 : 0.82))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isToday ? Color.indigo.opacity(0.6) : Color.clear, lineWidth: 1.5)
        )
    }
}

// MARK: - One day's example sentences

/// The example sentences that belong to a single Day. Tap a row to reveal the
/// English sentence and its grammar notes; tap the word chip, the revealed
/// sentence, or the button to open that word's card.
struct ExampleDayView: View {
    let day: Int
    @EnvironmentObject var store: WordStore

    /// Expanded rows, keyed by `ExampleRef.id` so the state survives the list
    /// being recomputed.
    @State private var expandedKeys: Set<String> = []
    @State private var detailWord: Word? = nil

    private var pairs: [(word: Word, exampleIdx: Int)] {
        ExamplePlan.pairs(forDay: day, in: store.words)
    }

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 10) {
                ForEach(Array(pairs.enumerated()), id: \.offset) { offset, pair in
                    row(number: offset + 1, word: pair.word, exampleIdx: pair.exampleIdx)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(GeometricBackground().ignoresSafeArea())
        .navigationTitle("Day \(day)")
        .navigationBarTitleDisplayMode(.inline)
        // `.sheet(item:)` (not isPresented + a separate state var) so the word
        // is always available when the sheet body is built — otherwise the
        // first tap opens an empty sheet.
        .sheet(item: $detailWord) { w in
            WordDetailSheet(word: w)
                .environmentObject(store)
        }
    }

    @ViewBuilder
    private func row(number: Int, word: Word, exampleIdx: Int) -> some View {
        let key = ExampleRef(wordId: word.id, exampleIdx: exampleIdx).id
        let isExpanded = expandedKeys.contains(key)
        let example = word.examples[exampleIdx]

        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Text("\(number).")
                    .font(.caption.bold())
                    .foregroundStyle(.tertiary)
                Button {
                    detailWord = word
                } label: {
                    HStack(spacing: 4) {
                        Text(word.word)
                            .font(.caption.bold())
                            .foregroundStyle(.indigo)
                        if let ipa = word.ipa, !ipa.isEmpty {
                            Text(ipa)
                                .font(.caption2)
                                .foregroundStyle(.indigo.opacity(0.7))
                        }
                        Image(systemName: "info.circle.fill")
                            .font(.caption2)
                            .foregroundStyle(.indigo.opacity(0.7))
                    }
                }
                .buttonStyle(.plain)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }

            HStack(alignment: .top, spacing: 8) {
                Button {
                    SpeechManager.shared.speak(example.english)
                } label: {
                    Image(systemName: "play.fill")
                        .font(.system(size: 13))
                        .foregroundStyle(.white)
                        .frame(width: 32, height: 32)
                        .background(Circle().fill(Color.indigo))
                }
                .buttonStyle(.plain)
                Text(example.japanese)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            if isExpanded {
                Divider().padding(.vertical, 2)
                VStack(alignment: .leading, spacing: 6) {
                    Text("英語例文").font(.caption2).foregroundStyle(.tertiary)
                    Button {
                        detailWord = word
                    } label: {
                        Text(example.english)
                            .font(.body)
                            .foregroundStyle(.primary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(.plain)
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("文法・語法の解説").font(.caption2).foregroundStyle(.tertiary)
                    if let grammar = example.grammar?.trimmingCharacters(in: .whitespacesAndNewlines),
                       !grammar.isEmpty {
                        Text(grammar)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    } else {
                        Text("この例文には解説がまだありません。")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
                Button {
                    detailWord = word
                } label: {
                    HStack(spacing: 6) {
                        Image(systemName: "rectangle.stack")
                        Text("この単語のカードを開く")
                    }
                    .font(.caption.bold())
                    .foregroundStyle(.indigo)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(Color.indigo.opacity(0.12)))
                }
                .buttonStyle(.plain)
            }
        }
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.82))
        )
        .contentShape(Rectangle())
        .onTapGesture {
            if isExpanded {
                expandedKeys.remove(key)
            } else {
                expandedKeys.insert(key)
            }
        }
    }
}

#Preview {
    ExampleListView()
        .environmentObject(WordStore())
}

// MARK: - Chinese review list (Home screen, second list)

/// Excel-style list of the Chinese vocabulary: 日本語 / 中国語 / ピンイン / 会話頻度.
///
/// Rows are deliberately short so a lot of words fit on screen for fast
/// review. Only 300 words are rendered at a time (chosen from the menu),
/// because putting several thousand rows in one scroll view is slow.
///
/// - Tap the **Chinese word** to open its card.
/// - Tap **anywhere else in the row** to mark it yellow ("don't know");
///   tap again to clear it.
struct ChineseReviewListView: View {
    @EnvironmentObject var store: WordStore

    /// How many words one page holds.
    private let pageSize = 300

    @AppStorage("chinese.page") private var page: Int = 0
    @State private var cardWord: ChineseWord? = nil

    private var all: [ChineseWord] { store.chineseWords }
    private var pageCount: Int {
        max(1, (all.count + pageSize - 1) / pageSize)
    }
    private var safePage: Int { min(max(page, 0), pageCount - 1) }
    private var rows: [ChineseWord] {
        let start = safePage * pageSize
        guard start < all.count else { return [] }
        return Array(all[start..<min(start + pageSize, all.count)])
    }

    private func rangeLabel(_ i: Int) -> String {
        let s = i * pageSize + 1
        let e = min((i + 1) * pageSize, all.count)
        return "\(s) 〜 \(e)"
    }

    var body: some View {
        VStack(spacing: 0) {
            toolbar
            header
            Divider()
            if all.isEmpty {
                Spacer()
                Text("単語が登録されていません")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Spacer()
            } else {
                ScrollViewReader { proxy in
                    ScrollView {
                        LazyVStack(spacing: 0) {
                            ForEach(rows) { w in
                                row(w)
                                Divider().opacity(0.4)
                            }
                        }
                        .id(safePage)          // jump back to the top on page change
                    }
                    .onChange(of: safePage) { _, _ in
                        proxy.scrollTo(safePage, anchor: .top)
                    }
                }
            }
        }
        .background(Color(.systemBackground))
        .sheet(item: $cardWord) { w in
            ChineseWordCard(word: w)
                .environmentObject(store)
        }
    }

    // MARK: Toolbar (page picker + marked counter)

    private var toolbar: some View {
        HStack(spacing: 10) {
            Menu {
                ForEach(0..<pageCount, id: \.self) { i in
                    Button {
                        page = i
                    } label: {
                        if i == safePage {
                            Label(rangeLabel(i), systemImage: "checkmark")
                        } else {
                            Text(rangeLabel(i))
                        }
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "list.number")
                    Text(rangeLabel(safePage)).bold()
                    Image(systemName: "chevron.down").font(.caption2)
                }
                .font(.subheadline)
                .padding(.horizontal, 12).padding(.vertical, 7)
                .background(Capsule().fill(Color.indigo.opacity(0.12)))
                .foregroundStyle(.indigo)
            }

            Spacer()

            Text("\(store.chineseMarks.count) 語")
                .font(.caption)
                .foregroundStyle(.secondary)
            Button {
                store.clearChineseMarks()
            } label: {
                Text("黄色をリセット").font(.caption)
            }
            .disabled(store.chineseMarks.isEmpty)
            .opacity(store.chineseMarks.isEmpty ? 0.4 : 1)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }

    private var header: some View {
        HStack(spacing: 6) {
            Text("日本語").frame(maxWidth: .infinity, alignment: .leading)
            Text("中国語").frame(width: 96, alignment: .leading)
            Text("ピンイン").frame(width: 84, alignment: .leading)
            Text("頻度").frame(width: 56, alignment: .leading)
        }
        .font(.caption2.bold())
        .foregroundStyle(.secondary)
        .padding(.horizontal, 12)
        .padding(.vertical, 5)
        .background(Color.indigo.opacity(0.06))
    }

    // MARK: Row

    private func row(_ w: ChineseWord) -> some View {
        let marked = store.chineseMarks.contains(w.id)
        return HStack(spacing: 6) {
            Text(w.japanese)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .leading)
            // Tapping the Chinese word opens the card; the rest of the row
            // toggles the yellow "don't know" highlight.
            Button {
                cardWord = w
            } label: {
                Text(w.chinese)
                    .fontWeight(.semibold)
                    .foregroundStyle(.indigo)
                    .lineLimit(1)
                    .frame(width: 96, alignment: .leading)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            Text(w.pinyin)
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .frame(width: 84, alignment: .leading)
            Text(w.stars)
                .foregroundStyle(.orange)
                .frame(width: 56, alignment: .leading)
        }
        .font(.system(size: 12))
        .padding(.horizontal, 12)
        .padding(.vertical, 5)          // keep rows short for fast scanning
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(marked ? Color.yellow.opacity(0.55) : Color.clear)
        .contentShape(Rectangle())
        .onTapGesture {
            store.toggleChineseMark(w.id)
        }
    }
}

/// Card shown when a Chinese word in the review list is tapped.
struct ChineseWordCard: View {
    let word: ChineseWord
    @EnvironmentObject var store: WordStore
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    VStack(alignment: .leading, spacing: 6) {
                        Text(word.chinese)
                            .font(.system(size: 34, weight: .bold))
                        Text(word.pinyin)
                            .font(.title3)
                            .foregroundStyle(.indigo)
                        Text(word.japanese)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }

                    HStack(spacing: 8) {
                        Text("会話頻度").font(.caption).foregroundStyle(.tertiary)
                        Text(word.stars).font(.subheadline).foregroundStyle(.orange)
                    }

                    if !word.exampleList.isEmpty {
                        Divider()
                        Text("よく使う用例").font(.caption).foregroundStyle(.tertiary)
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(Array(word.exampleList.enumerated()), id: \.offset) { _, ex in
                                Text(ex)
                                    .font(.body)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }

                    Button {
                        store.toggleChineseMark(word.id)
                    } label: {
                        let marked = store.chineseMarks.contains(word.id)
                        HStack {
                            Spacer()
                            Image(systemName: marked ? "checkmark.circle.fill" : "circle")
                            Text(marked ? "分からない（マーク中）" : "分からないをマーク").bold()
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .foregroundStyle(marked ? .black : .indigo)
                        .background(marked ? Color.yellow.opacity(0.7) : Color.indigo.opacity(0.12))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .buttonStyle(.plain)

                    Spacer(minLength: 12)
                }
                .padding(16)
            }
            .navigationTitle("単語カード")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("閉じる") { dismiss() }
                }
            }
        }
    }
}
