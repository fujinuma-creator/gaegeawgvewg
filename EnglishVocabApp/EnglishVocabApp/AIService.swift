import Foundation

enum AIServiceError: LocalizedError {
    case missingKey
    case http(Int, String)
    case badResponse
    case decoding(String)

    var errorDescription: String? {
        switch self {
        case .missingKey: return "APIキーが設定されていません。設定画面でキーを保存してください。"
        case .http(let code, let body):
            switch code {
            case 401, 403: return "APIキーが正しくないか、権限がありません（\(code)）。"
            case 429: return "利用上限に達しました。しばらくしてから試してください（429）。"
            default: return "通信エラー（\(code)）: \(body.prefix(160))"
            }
        case .badResponse: return "応答を読み取れませんでした。"
        case .decoding(let raw): return "例文の形式が想定と違いました: \(raw.prefix(200))"
        }
    }
}

/// Generates new example sentences with Claude / OpenAI / Gemini, whichever
/// is selected in 設定. Every provider is asked for the same JSON shape:
/// `{"examples":[{"english":"…","ipa":"…","japanese":"…"}]}`.
enum AIService {

    // MARK: Public API

    static func generateExamples(for word: Word) async throws -> [Example] {
        let s = AppSettings.shared
        let prompt = examplePrompt(for: word, count: s.examplesPerRun, style: s.casualness)
        let text = try await complete(prompt: prompt, provider: s.provider)
        return try parseExamples(text)
    }

    // MARK: 単語の追加（全単語の ＋）

    private struct WordEnvelope: Decodable {
        struct Item: Decodable { let english: String; let ipa: String?; let japanese: String? }
        let word: String
        let ipa: String?
        let japanese: String
        let definition: String?
        let useCase: String?
        let examples: [Item]?
        let related: [Item]?
    }

    /// Builds a full vocabulary entry from what the user typed. The input can
    /// be English (put off) or Japanese (先延ばしにする).
    static func generateWord(from input: String) async throws -> Word {
        let s = AppSettings.shared
        let prompt = """
        あなたは日本人向けの英語（日常会話で使う口語）単語帳の作成者です。
        ユーザーが入力した「\(input)」から、単語帳の1項目を作ってください。
        入力は英語か日本語です。日本語なら、それを表すネイティブが実際に使う自然な英語表現を見出し語にしてください。

        スタイル: \(s.casualness.promptHint)
        ルール:
        - word は英語の見出し語（句動詞・イディオムはそのままの形）。
        - ipa はイギリス英語（RP）の発音記号。スラッシュで囲む（例: /pʌt ˈɒf/）。
        - japanese は短い日本語の意味（「・」で区切って2つまで）。
        - definition は英語での短い説明（10語程度）。
        - useCase は「〜とき」で終わる短い日本語。
        - examples は \(max(2, s.examplesPerRun)) 個。5〜12語の自然な口語、毎回違う場面。各 english / ipa / japanese。
        - related は似た表現・言い換え 1〜2 個。各 english / ipa / japanese。
        - 出力は次のJSONのみ。説明やMarkdownは不要。
        {"word":"…","ipa":"…","japanese":"…","definition":"…","useCase":"…","examples":[{"english":"…","ipa":"…","japanese":"…"}],"related":[{"english":"…","ipa":"…","japanese":"…"}]}
        """
        let text = try await complete(prompt: prompt, provider: s.provider, maxTokens: 1200)
        var t = text.replacingOccurrences(of: "```json", with: "").replacingOccurrences(of: "```", with: "")
        if let a = t.firstIndex(of: "{"), let b = t.lastIndex(of: "}") { t = String(t[a...b]) }
        guard let data = t.data(using: .utf8),
              let e = try? JSONDecoder().decode(WordEnvelope.self, from: data),
              !e.word.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw AIServiceError.decoding(text)
        }
        func ex(_ i: WordEnvelope.Item) -> Example { Example(english: i.english, ipa: i.ipa ?? "", japanese: i.japanese ?? "") }
        var w = Word(id: "u-" + UUID().uuidString,
                     word: e.word.trimmingCharacters(in: .whitespacesAndNewlines),
                     ipa: (e.ipa ?? "").trimmingCharacters(in: .whitespacesAndNewlines),
                     japanese: e.japanese,
                     definition: e.definition ?? "",
                     useCases: (e.useCase?.isEmpty == false) ? [e.useCase!] : [],
                     examples: (e.examples ?? []).map(ex),
                     related: (e.related ?? []).map(ex))
        w.createdAt = Date()
        w.nextReviewDate = Date().startOfDay
        return w
    }

    /// 発音画面の「↻」: new example words that contain the given sound.
    static func generateSoundWords(for item: SoundItem, existing: [SoundWord], count: Int = 5) async throws -> [SoundWord] {
        let s = AppSettings.shared
        let avoid = existing.prefix(40).map { $0.word }.joined(separator: ", ")
        let prompt = """
        あなたは日本人向けの英語教材の作成者です。
        イギリス英語（RP）の発音記号で \(item.symbol)（\(item.name)）の音を含む、日常会話でよく使う英単語を \(count) 個挙げてください。
        1〜2音節の短い単語を中心に、意味がはっきりしたものを選び、次の単語は使わないでください: \(avoid)

        ルール:
        - word は英語のつづり。ipa はイギリス英語（RP）の発音記号で、必ず \(item.symbol) を含むこと。スラッシュで囲む（例: /ʃiːp/）。
        - japanese は短い日本語の意味。
        - 出力は次のJSONのみ。説明やMarkdownは不要。
        {"words":[{"word":"…","ipa":"…","japanese":"…"}]}
        """
        let text = try await complete(prompt: prompt, provider: s.provider, maxTokens: 600)
        var t = text.replacingOccurrences(of: "```json", with: "").replacingOccurrences(of: "```", with: "")
        if let a = t.firstIndex(of: "{"), let b = t.lastIndex(of: "}") { t = String(t[a...b]) }
        struct Env: Decodable { let words: [SoundWord] }
        guard let data = t.data(using: .utf8), let env = try? JSONDecoder().decode(Env.self, from: data) else {
            throw AIServiceError.decoding(text)
        }
        let ok = env.words.filter { PronunciationSeed.matches($0.ipa, soundId: item.id) }
        if ok.isEmpty { throw AIServiceError.decoding("この音に合う単語が返ってきませんでした") }
        return ok
    }

    /// 接続テスト: a tiny request that proves the key works.
    static func testConnection(provider: AIProvider) async throws {
        _ = try await complete(prompt: "「Hello」を日本語に訳して、1語だけ答えてください。", provider: provider, maxTokens: 20)
    }

    // MARK: Prompt

    private static func examplePrompt(for w: Word, count: Int, style: Casualness) -> String {
        let existing = w.examples.map { "- \($0.english)" }.joined(separator: "\n")
        return """
        あなたは日本人向けの英語（日常会話の口語）教材の作成者です。
        英語の表現「\(w.word)」（意味: \(w.japanese)）を使った新しい例文を \(count) 個作ってください。

        スタイル: \(style.promptHint)
        すでにある例文（これとは別の文にすること）:
        \(existing)

        ルール:
        - 1文は5〜12語。ネイティブが実際に言う自然な口語。毎回違う場面（職場、友達、買い物、旅行、家族など）。
        - ipa はイギリス英語（RP）の発音記号。文全体を書き、スラッシュで囲む。
        - japanese は短く自然な日本語訳。
        - 出力は次のJSONのみ。説明やMarkdownは不要。
        {"examples":[{"english":"…","ipa":"…","japanese":"…"}]}
        """
    }

    private struct Envelope: Decodable {
        struct Item: Decodable { let english: String; let ipa: String?; let japanese: String? }
        let examples: [Item]
    }

    private static func parseExamples(_ text: String) throws -> [Example] {
        // Strip ``` fences and anything before the first "{".
        var t = text.replacingOccurrences(of: "```json", with: "").replacingOccurrences(of: "```", with: "")
        if let a = t.firstIndex(of: "{"), let b = t.lastIndex(of: "}") { t = String(t[a...b]) }
        guard let data = t.data(using: .utf8),
              let env = try? JSONDecoder().decode(Envelope.self, from: data) else {
            throw AIServiceError.decoding(text)
        }
        return env.examples.map { Example(english: $0.english, ipa: $0.ipa ?? "", japanese: $0.japanese ?? "") }
    }

    // MARK: Transport

    private static let session: URLSession = {
        let c = URLSessionConfiguration.ephemeral
        c.urlCache = nil
        c.requestCachePolicy = .reloadIgnoringLocalCacheData
        return URLSession(configuration: c)
    }()

    private static func complete(prompt: String, provider: AIProvider, maxTokens: Int = 1024) async throws -> String {
        guard let key = KeychainHelper.get(provider.keychainKey), !key.isEmpty else {
            throw AIServiceError.missingKey
        }
        var req: URLRequest
        var body: [String: Any]

        switch provider {
        case .claude:
            req = URLRequest(url: URL(string: "https://api.anthropic.com/v1/messages")!)
            req.addValue(key, forHTTPHeaderField: "x-api-key")
            req.addValue("2023-06-01", forHTTPHeaderField: "anthropic-version")
            body = [
                "model": "claude-sonnet-5-5",
                "max_tokens": maxTokens,
                "messages": [["role": "user", "content": prompt]]
            ]
        case .openAI:
            req = URLRequest(url: URL(string: "https://api.openai.com/v1/chat/completions")!)
            req.addValue("Bearer \(key)", forHTTPHeaderField: "Authorization")
            body = [
                "model": "gpt-4o-mini",
                "max_tokens": maxTokens,
                "messages": [["role": "user", "content": prompt]]
            ]
        case .gemini:
            // Send the key in a header, not the URL query, so it can't end up in
            // URL logs, error messages or proxy access logs.
            req = URLRequest(url: URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent")!)
            req.addValue(key, forHTTPHeaderField: "x-goog-api-key")
            body = [
                "contents": [["parts": [["text": prompt]]]],
                "generationConfig": ["maxOutputTokens": maxTokens, "temperature": 0.6]
            ]
        }
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONSerialization.data(withJSONObject: body)
        req.timeoutInterval = 40

        // Ephemeral session: no on-disk cache/cookies for API traffic.
        let (data, response) = try await session.data(for: req)
        guard let http = response as? HTTPURLResponse else { throw AIServiceError.badResponse }
        guard (200..<300).contains(http.statusCode) else {
            throw AIServiceError.http(http.statusCode, String(data: data, encoding: .utf8) ?? "")
        }
        guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw AIServiceError.badResponse
        }

        switch provider {
        case .claude:
            if let content = json["content"] as? [[String: Any]],
               let text = content.first?["text"] as? String { return text }
        case .openAI:
            if let choices = json["choices"] as? [[String: Any]],
               let msg = choices.first?["message"] as? [String: Any],
               let text = msg["content"] as? String { return text }
        case .gemini:
            if let cands = json["candidates"] as? [[String: Any]],
               let content = cands.first?["content"] as? [String: Any],
               let parts = content["parts"] as? [[String: Any]],
               let text = parts.first?["text"] as? String { return text }
        }
        throw AIServiceError.badResponse
    }
}
