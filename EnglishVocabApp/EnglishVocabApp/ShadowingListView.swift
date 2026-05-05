import SwiftUI

/// Shadowing practice: scrollable list of every example sentence in the
/// review list. Each row plays the English audio, with the Japanese
/// translation as the visible heading. Tap the row to reveal the English
/// sentence and its grammar explanation.
struct ShadowingListView: View {
    @EnvironmentObject var store: WordStore
    @State private var expandedIds: Set<UUID> = []

    private var queue: [(word: Word, exampleIdx: Int)] {
        store.reviewListWords
            .filter { !$0.examples.isEmpty }
            .dailyShuffled()
            .flatMap { (w: Word) -> [(word: Word, exampleIdx: Int)] in
                (0..<w.examples.count).map { idx in
                    (word: w, exampleIdx: idx)
                }
            }
    }

    var body: some View {
        let q = queue
        if q.isEmpty {
            VStack(spacing: 10) {
                Image(systemName: "headphones")
                    .font(.system(size: 50))
                    .foregroundStyle(.indigo)
                Text("シャドウイングする例文がありません")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                Text("「一覧」のチェックで単語を復習リストに追加してください\n（追加から1週間で自動的に消えます）")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.tertiary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        } else {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("音声を聞いて、続けて発音してみよう（\(q.count) 文）")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    LazyVStack(spacing: 10) {
                        ForEach(q.indices, id: \.self) { idx in
                            let pair = q[idx]
                            if pair.exampleIdx < pair.word.examples.count {
                                shadowingRow(
                                    index: idx,
                                    word: pair.word,
                                    example: pair.word.examples[pair.exampleIdx]
                                )
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                }
            }
        }
    }

    private func shadowingRow(index: Int, word: Word, example: ExampleSentence) -> some View {
        let isExpanded = expandedIds.contains(example.id)
        return VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("\(index + 1).")
                    .font(.caption.bold())
                    .foregroundStyle(.tertiary)
                Text(word.word)
                    .font(.caption.bold())
                    .foregroundStyle(.indigo)
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .font(.caption2)
                    .foregroundStyle(.tertiary)
            }

            HStack(alignment: .top, spacing: 8) {
                Button {
                    SpeechManager.shared.speak(example.english, rate: 0.48)
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
                    Text(example.english)
                        .font(.body)
                        .foregroundStyle(.primary)
                }
                VStack(alignment: .leading, spacing: 6) {
                    Text("文法・語法の解説").font(.caption2).foregroundStyle(.tertiary)
                    if let grammar = example.grammar?.trimmingCharacters(in: .whitespacesAndNewlines),
                       !grammar.isEmpty {
                        Text(grammar)
                            .font(.subheadline)
                            .foregroundStyle(.primary)
                    } else {
                        Text("この例文には解説がまだありません。「新しい例文を生成」で更新できます。")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
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
                expandedIds.remove(example.id)
            } else {
                expandedIds.insert(example.id)
            }
        }
    }
}

#Preview {
    ShadowingListView()
        .environmentObject(WordStore())
}
