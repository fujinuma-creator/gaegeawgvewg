import SwiftUI

struct AddWordView: View {
    @EnvironmentObject var store: WordStore
    @Environment(\.dismiss) private var dismiss

    @State private var word = ""
    @State private var definitionEnglish = ""
    @State private var definitionJapanese = ""
    @State private var useCasesText = ""
    @State private var exampleEntries: [ExampleEntry] = [.init(), .init(), .init()]
    @State private var synonymEntries: [SynonymEntry] = [.init()]

    @State private var showSavedAlert = false
    @State private var isGenerating = false
    @State private var generationError: String? = nil
    @State private var showGenerationError = false

    var body: some View {
        NavigationStack {
            Form {
                Section("英単語") {
                    TextField("例: thread", text: $word)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    Button {
                        Task { await generateWithAI() }
                    } label: {
                        HStack {
                            if isGenerating {
                                ProgressView()
                                    .padding(.trailing, 4)
                                Text("AI で生成中…")
                            } else {
                                Image(systemName: "sparkles")
                                Text("AI で自動生成")
                                    .bold()
                            }
                            Spacer()
                        }
                        .foregroundStyle(canGenerate ? .indigo : .secondary)
                    }
                    .disabled(!canGenerate || isGenerating)
                }

                Section("英語の定義 / 日本語訳") {
                    TextField("English definition", text: $definitionEnglish, axis: .vertical)
                        .lineLimit(2...5)
                    TextField("日本語訳", text: $definitionJapanese, axis: .vertical)
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
                            TextField("英語の定義（任意）", text: $syn.definitionEnglish, axis: .vertical)
                                .lineLimit(1...3)
                            TextField("使う場面（1行に1つ・任意）", text: $syn.useCasesText, axis: .vertical)
                                .lineLimit(1...4)
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
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("閉じる") { dismiss() }
                }
            }
            .alert("追加しました", isPresented: $showSavedAlert) {
                Button("続けて追加") { reset() }
                Button("閉じる", role: .cancel) { dismiss() }
            }
            .alert("AI 生成に失敗しました", isPresented: $showGenerationError, presenting: generationError) { _ in
                Button("OK", role: .cancel) {}
            } message: { msg in
                Text(msg)
            }
        }
    }

    private var canGenerate: Bool {
        !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    @MainActor
    private func generateWithAI() async {
        let term = word.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !term.isEmpty else { return }
        isGenerating = true
        defer { isGenerating = false }
        do {
            let result = try await GeminiService.generateWord(for: term)
            applyGenerated(result)
        } catch {
            generationError = error.localizedDescription
            showGenerationError = true
        }
    }

    private func applyGenerated(_ g: GeneratedWord) {
        definitionEnglish = g.definitionEnglish
        definitionJapanese = g.definitionJapanese
        useCasesText = g.useCases.joined(separator: "\n")
        exampleEntries = g.examples.map { ex in
            var e = ExampleEntry()
            e.english = ex.english
            e.japanese = ex.japanese
            return e
        }
        if exampleEntries.isEmpty { exampleEntries = [.init()] }

        synonymEntries = (g.synonyms ?? []).map { syn in
            var e = SynonymEntry()
            e.word = syn.word
            e.meaning = syn.meaning
            e.definitionEnglish = syn.definitionEnglish ?? ""
            e.useCasesText = (syn.useCases ?? []).joined(separator: "\n")
            e.examples = (syn.examples ?? []).map { ex in
                var ee = ExampleEntry()
                ee.english = ex.english
                ee.japanese = ex.japanese
                return ee
            }
            if e.examples.isEmpty { e.examples = [.init()] }
            return e
        }
        if synonymEntries.isEmpty { synonymEntries = [.init()] }
    }

    private var canSave: Bool {
        !word.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            && !definitionJapanese.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
                let synUseCases = entry.useCasesText
                    .split(whereSeparator: { $0.isNewline })
                    .map { $0.trimmingCharacters(in: .whitespaces) }
                    .filter { !$0.isEmpty }
                return SynonymGroup(
                    word: entry.word,
                    meaning: entry.meaning,
                    definitionEnglish: entry.definitionEnglish,
                    useCases: synUseCases,
                    examples: exs
                )
            }

        let now = Date()
        let newWord = Word(
            word: word.trimmingCharacters(in: .whitespaces),
            definitionEnglish: definitionEnglish,
            definitionJapanese: definitionJapanese,
            useCases: useCases,
            examples: examples,
            synonyms: synonyms,
            reviewCount: 0,
            status: .unlearned,
            nextReviewDate: now,
            lastReviewedDate: nil,
            createdAt: now
        )
        store.add(newWord)
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
    var definitionEnglish: String = ""
    var useCasesText: String = ""
    var examples: [ExampleEntry] = [.init(), .init()]
}

#Preview {
    AddWordView()
        .environmentObject(WordStore())
}
