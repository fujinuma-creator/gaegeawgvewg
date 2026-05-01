import SwiftUI

struct WordListView: View {
    @EnvironmentObject var store: WordStore
    @State private var searchText = ""

    var filteredWords: [Word] {
        let sorted = store.words.sorted { $0.nextReviewDate < $1.nextReviewDate }
        if searchText.isEmpty {
            return sorted
        }
        return sorted.filter {
            $0.word.localizedCaseInsensitiveContains(searchText)
            || $0.definitionEnglish.localizedCaseInsensitiveContains(searchText)
            || $0.definitionJapanese.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredWords) { word in
                    NavigationLink(value: word) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(word.word)
                                .font(.headline)
                            Text(word.definitionJapanese.isEmpty
                                 ? word.definitionEnglish
                                 : word.definitionJapanese)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .lineLimit(2)
                            HStack(spacing: 8) {
                                Label(word.stage.label, systemImage: "calendar")
                                Spacer()
                                Text("次回: \(word.nextReviewDate.formatted(date: .abbreviated, time: .omitted))")
                            }
                            .font(.caption)
                            .foregroundStyle(.tertiary)
                        }
                    }
                }
                .onDelete(perform: store.delete(at:))
            }
            .navigationTitle("単語帳 (\(store.words.count))")
            .searchable(text: $searchText, prompt: "単語を検索")
            .navigationDestination(for: Word.self) { word in
                WordDetailView(word: word)
            }
        }
    }
}

struct WordDetailView: View {
    @EnvironmentObject var store: WordStore
    let word: Word

    var current: Word {
        store.words.first(where: { $0.id == word.id }) ?? word
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(current.word)
                    .font(.system(size: 30, weight: .bold))

                Divider()

                Group {
                    Text("■ 英語の定義").font(.headline)
                    Text(current.definitionEnglish)
                    Text("→ \(current.definitionJapanese)")
                        .foregroundStyle(.secondary)
                }

                if !current.useCases.isEmpty {
                    Group {
                        Text("■ 使う場面").font(.headline)
                        ForEach(current.useCases, id: \.self) { Text("・\($0)") }
                    }
                }

                if !current.examples.isEmpty {
                    Group {
                        Text("■ 例文").font(.headline)
                        ForEach(Array(current.examples.enumerated()), id: \.element.id) { idx, ex in
                            VStack(alignment: .leading, spacing: 2) {
                                Text("\(idx + 1). \(ex.english)")
                                Text("→ \(ex.japanese)")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.bottom, 4)
                        }
                    }
                }

                if !current.synonyms.isEmpty {
                    Group {
                        Text("■ 類義語").font(.headline)
                        ForEach(current.synonyms) { syn in
                            VStack(alignment: .leading, spacing: 4) {
                                Text("\(syn.word)（\(syn.meaning)）").font(.subheadline.bold())
                                ForEach(syn.examples) { ex in
                                    VStack(alignment: .leading) {
                                        Text("• \(ex.english)")
                                        Text("  → \(ex.japanese)")
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                            .padding(.bottom, 6)
                        }
                    }
                }

                Divider()

                VStack(alignment: .leading, spacing: 6) {
                    Text("復習状況").font(.headline)
                    Text("段階: \(current.stage.label)")
                    Text("次回復習: \(current.nextReviewDate.formatted(date: .complete, time: .omitted))")
                    if let last = current.lastReviewedDate {
                        Text("最終復習: \(last.formatted(date: .abbreviated, time: .omitted))")
                    }
                    Text("登録日: \(current.createdAt.formatted(date: .abbreviated, time: .omitted))")
                }
                .font(.callout)
                .foregroundStyle(.secondary)
            }
            .padding()
        }
        .navigationTitle(current.word)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(role: .destructive) {
                    store.delete(id: current.id)
                } label: {
                    Image(systemName: "trash")
                }
            }
        }
    }
}

#Preview {
    WordListView()
        .environmentObject(WordStore())
}
