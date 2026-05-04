import SwiftUI

struct AddWordView: View {
    @EnvironmentObject var store: WordStore
    @Environment(\.dismiss) private var dismiss

    @State private var wordsText: String = ""
    @State private var apiKey: String = ""
    @State private var revealKey: Bool = false
    @State private var showAPIKeyHelp: Bool = false

    @State private var isGenerating: Bool = false
    @State private var progressDone: Int = 0
    @State private var progressTotal: Int = 0
    @State private var addedCount: Int = 0
    @State private var skippedDuplicates: [String] = []
    @State private var failedWords: [(word: String, message: String)] = []
    @State private var showResult: Bool = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextEditor(text: $wordsText)
                        .frame(minHeight: 180)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .font(.body)
                } header: {
                    Text("英単語を入力（改行で区切る・推奨10個まで）")
                } footer: {
                    Text(footerCount)
                        .foregroundStyle(footerColor)
                }

                Section {
                    Button {
                        Task { await generate() }
                    } label: {
                        HStack {
                            Spacer()
                            if isGenerating {
                                ProgressView()
                                    .tint(.white)
                                    .padding(.trailing, 4)
                                Text("\(progressDone) / \(progressTotal) 単語を生成中…")
                                    .bold()
                            } else {
                                Image(systemName: "sparkles")
                                Text("AI で自動生成")
                                    .bold()
                            }
                            Spacer()
                        }
                        .padding(.vertical, 4)
                        .foregroundStyle(.white)
                    }
                    .listRowBackground(canGenerate ? Color.indigo : Color.indigo.opacity(0.4))
                    .disabled(!canGenerate)
                }

                Section {
                    if revealKey {
                        TextField("AIzaSy...", text: $apiKey)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .font(.system(.body, design: .monospaced))
                            .onChange(of: apiKey) { _, newValue in
                                saveKey(newValue)
                            }
                    } else {
                        SecureField("AIzaSy...", text: $apiKey)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .font(.system(.body, design: .monospaced))
                            .onChange(of: apiKey) { _, newValue in
                                saveKey(newValue)
                            }
                    }
                    Toggle("キーを表示", isOn: $revealKey)
                        .font(.subheadline)
                    DisclosureGroup(isExpanded: $showAPIKeyHelp) {
                        APIKeyHelpView()
                    } label: {
                        Label("Gemini API キーの取得方法", systemImage: "questionmark.circle")
                            .font(.subheadline)
                    }
                } header: {
                    Text("Gemini API キー（必須）")
                } footer: {
                    Text("入力すると自動的に端末の Keychain に暗号化して保存されます。")
                }
            }
            .navigationTitle("単語を追加")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("閉じる") { dismiss() }
                        .disabled(isGenerating)
                }
            }
            .onAppear {
                apiKey = KeychainHelper.get(SecretKey.geminiAPIKey) ?? ""
            }
            .alert(resultTitle, isPresented: $showResult) {
                if addedCount > 0 && failedWords.isEmpty && skippedDuplicates.isEmpty {
                    Button("OK", role: .cancel) {
                        wordsText = ""
                        dismiss()
                    }
                } else {
                    Button("OK", role: .cancel) {
                        // Keep the typed words around so user can retry the failures.
                    }
                }
            } message: {
                Text(resultMessage)
            }
        }
    }

    // MARK: - Derived

    private var trimmedWords: [String] {
        wordsText
            .split(whereSeparator: { $0.isNewline })
            .map { $0.trimmingCharacters(in: .whitespaces) }
            .filter { !$0.isEmpty }
    }

    private var canGenerate: Bool {
        !isGenerating && !trimmedWords.isEmpty && !apiKey.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    private var footerCount: String {
        let n = trimmedWords.count
        if n == 0 { return "まだ単語が入力されていません。" }
        if n > 10 { return "\(n) 個入力中（推奨は10個まで・処理に時間がかかります）" }
        return "\(n) 個入力中"
    }

    private var footerColor: Color {
        trimmedWords.count > 10 ? .orange : .secondary
    }

    private var resultTitle: String {
        if addedCount > 0 && failedWords.isEmpty && skippedDuplicates.isEmpty {
            return "\(addedCount) 個追加しました"
        } else if addedCount == 0 && (!failedWords.isEmpty || !skippedDuplicates.isEmpty) {
            return "追加できませんでした"
        } else {
            return "完了：\(addedCount) 個追加"
        }
    }

    private var resultMessage: String {
        var lines: [String] = []
        if !skippedDuplicates.isEmpty {
            lines.append("既に存在: \(skippedDuplicates.joined(separator: ", "))")
        }
        if !failedWords.isEmpty {
            let summary = failedWords
                .prefix(5)
                .map { "・\($0.word): \($0.message)" }
                .joined(separator: "\n")
            lines.append("失敗:\n\(summary)")
            if failedWords.count > 5 {
                lines.append("…他 \(failedWords.count - 5) 件")
            }
        }
        return lines.isEmpty ? "" : lines.joined(separator: "\n\n")
    }

    // MARK: - Actions

    private func saveKey(_ value: String) {
        let trimmed = value.trimmingCharacters(in: .whitespacesAndNewlines)
        KeychainHelper.set(trimmed.isEmpty ? nil : trimmed, for: SecretKey.geminiAPIKey)
    }

    @MainActor
    private func generate() async {
        let words = trimmedWords
        guard !words.isEmpty else { return }
        let existing = Set(store.words.map { $0.word.lowercased() })

        isGenerating = true
        progressDone = 0
        progressTotal = words.count
        addedCount = 0
        skippedDuplicates = []
        failedWords = []

        for w in words {
            defer { progressDone += 1 }
            if existing.contains(w.lowercased())
                || store.words.contains(where: { $0.word.lowercased() == w.lowercased() }) {
                skippedDuplicates.append(w)
                continue
            }
            do {
                let g = try await GeminiService.generateWord(for: w)
                let now = Date()
                let newWord = Word(
                    word: w,
                    definitionEnglish: g.definitionEnglish,
                    definitionJapanese: g.definitionJapanese,
                    useCases: g.useCases,
                    examples: g.examples.map { ExampleSentence(english: $0.english, japanese: $0.japanese) },
                    synonyms: (g.synonyms ?? []).map { syn in
                        SynonymGroup(
                            word: syn.word,
                            meaning: syn.meaning,
                            definitionEnglish: syn.definitionEnglish ?? "",
                            useCases: syn.useCases ?? [],
                            examples: (syn.examples ?? []).map {
                                ExampleSentence(english: $0.english, japanese: $0.japanese)
                            }
                        )
                    },
                    reviewCount: 0,
                    status: .unlearned,
                    nextReviewDate: now,
                    lastReviewedDate: nil,
                    createdAt: now
                )
                store.add(newWord)
                addedCount += 1
            } catch {
                failedWords.append((word: w, message: error.localizedDescription))
            }
        }

        isGenerating = false
        showResult = true
    }
}

// MARK: - API key help

private struct APIKeyHelpView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            stepRow("1.", "下のリンクをタップして Google AI Studio を開く")
            Link(destination: URL(string: "https://aistudio.google.com/apikey")!) {
                Label("aistudio.google.com/apikey", systemImage: "safari")
                    .font(.subheadline)
            }
            .padding(.leading, 28)

            stepRow("2.", "Google アカウントでログイン（普段使ってる Gmail でOK）")
            stepRow("3.", "「Create API key」または「APIキーを作成」をタップ")
            stepRow("4.", "プロジェクトを選択（なければ新規作成、デフォルトでOK）")
            stepRow("5.", "表示された「AIzaSy…」で始まる文字列をコピー")
            stepRow("6.", "このアプリに戻り、上の入力欄に貼り付ける")

            Divider().padding(.vertical, 4)

            VStack(alignment: .leading, spacing: 6) {
                Label("料金について", systemImage: "yensign.circle")
                    .font(.subheadline.bold())
                Text("無料枠で十分使えます（個人利用なら使い切ることはほぼありません）。クレジットカードを登録しなければ自動課金は発生しません。")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            VStack(alignment: .leading, spacing: 6) {
                Label("セキュリティ", systemImage: "lock.shield")
                    .font(.subheadline.bold())
                Text("入力したキーは端末内の Keychain に暗号化して保存されます。サーバーやログには送信されません。万一漏れた場合は Google AI Studio の同じページで再発行できます。")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 8)
    }

    private func stepRow(_ number: String, _ text: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text(number)
                .font(.subheadline.bold())
                .foregroundStyle(.indigo)
                .frame(width: 20, alignment: .leading)
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    AddWordView()
        .environmentObject(WordStore())
}
