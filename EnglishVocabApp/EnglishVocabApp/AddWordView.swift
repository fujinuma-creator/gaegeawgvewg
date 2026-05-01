import SwiftUI

struct AddWordView: View {
    @EnvironmentObject var store: WordStore

    @State private var word = ""
    @State private var definitionEnglish = ""
    @State private var definitionJapanese = ""
    @State private var useCasesText = ""
    @State private var exampleEntries: [ExampleEntry] = [.init(), .init(), .init()]
    @State private var synonymEntries: [SynonymEntry] = [.init()]

    @State private var showSavedAlert = false

    var body: some View {
        NavigationStack {
            Form {
                Section("英単語") {
                    TextField("例: thread", text: $word)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                }

                Section("英語の定義 / 日本語訳") {
                    TextField("English definition", text: $definitionEnglish, axis: .vertical)
                        .lineLimit(2...5)
                    TextField("日本語訳（→の右）", text: $definitionJapanese, axis: .vertical)
                        .lineLimit(1...3)
                }

                Section("使う場面（1行に1つ）") {
                    TextField("例: 裁縫の糸\nXや掲示板の投稿の流れ", text: $useCasesText, axis: .vertical)
                        .lineLimit(2...6)
                }

                Section("例文") {
                    ForEach($exampleEntries) { $entry in
                        VStack(alignment: .leading) {
                            TextField("English", text: $entry.english, axis: .vertical)
                                .lineLimit(1...3)
                            TextField("日本語訳", text: $entry.japanese, axis: .vertical)
                                .lineLimit(1...3)
                                .foregroundStyle(.secondary)
                        }
                    }
                    Button {
                        exampleEntries.append(.init())
                    } label: {
                        Label("例文を追加", systemImage: "plus.circle")
                    }
                }

                Section("類義語") {
                    ForEach($synonymEntries) { $syn in
                        VStack(alignment: .leading, spacing: 8) {
                            TextField("類義語（例: string）", text: $syn.word)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                            TextField("意味（例: ひも）", text: $syn.meaning)
                            ForEach($syn.examples) { $ex in
                                VStack(alignment: .leading) {
                                    TextField("English", text: $ex.english, axis: .vertical)
                                        .lineLimit(1...3)
                                    TextField("日本語訳", text: $ex.japanese, axis: .vertical)
                                        .lineLimit(1...3)
                                        .foregroundStyle(.secondary)
                                }
                            }
                            Button {
                                syn.examples.append(.init())
                            } label: {
                                Label("例文を追加", systemImage: "plus.circle")
                            }
                            .font(.footnote)
                        }
                        .padding(.vertical, 4)
                    }
                    Button {
                        synonymEntries.append(.init())
                    } label: {
                        Label("類義語を追加", systemImage: "plus.circle")
                    }
                }

                Section {
                    Button {
                        save()
                    } label: {
                        HStack {
                            Spacer()
                            Text("単語を追加")
                                .bold()
                            Spacer()
                        }
                    }
                    .disabled(!canSave)
                }
            }
            .navigationTitle("単語を追加")
            .alert("追加しました", isPresented: $showSavedAlert) {
                Button("OK", role: .cancel) {}
            }
        }
    }

    private var canSave: Bool {
        !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !definitionEnglish.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private func save() {
        let useCases = useCasesText
            .split(whereSeparator: { $0.isNewline })
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }

        let examples: [ExampleSentence] = exampleEntries
            .filter { !$0.english.trimmingCharacters(in: .whitespaces).isEmpty }
            .map { ExampleSentence(english: $0.english, japanese: $0.japanese) }

        let synonyms: [SynonymGroup] = synonymEntries
            .filter { !$0.word.trimmingCharacters(in: .whitespaces).isEmpty }
            .map { entry in
                let exs = entry.examples
                    .filter { !$0.english.trimmingCharacters(in: .whitespaces).isEmpty }
                    .map { ExampleSentence(english: $0.english, japanese: $0.japanese) }
                return SynonymGroup(word: entry.word, meaning: entry.meaning, examples: exs)
            }

        let now = Date()
        let newWord = Word(
            word: word.trimmingCharacters(in: .whitespaces),
            definitionEnglish: definitionEnglish,
            definitionJapanese: definitionJapanese,
            useCases: useCases,
            examples: examples,
            synonyms: synonyms,
            stage: .nextDay,
            nextReviewDate: now,
            lastReviewedDate: nil,
            createdAt: now
        )
        store.add(newWord)
        reset()
        showSavedAlert = true
    }

    private func reset() {
        word = ""
        definitionEnglish = ""
        definitionJapanese = ""
        useCasesText = ""
        exampleEntries = [.init(), .init(), .init()]
        synonymEntries = [.init()]
    }
}

// MARK: - Form helper structs

struct ExampleEntry: Identifiable {
    let id = UUID()
    var english: String = ""
    var japanese: String = ""
}

struct SynonymEntry: Identifiable {
    let id = UUID()
    var word: String = ""
    var meaning: String = ""
    var examples: [ExampleEntry] = [.init(), .init()]
}

#Preview {
    AddWordView()
        .environmentObject(WordStore())
}
