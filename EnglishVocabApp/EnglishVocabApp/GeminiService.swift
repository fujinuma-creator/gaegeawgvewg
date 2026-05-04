import Foundation

enum GeminiServiceError: LocalizedError {
    case missingAPIKey
    case invalidResponse
    case http(Int, String)
    case decoding(String)
    case noText

    var errorDescription: String? {
        switch self {
        case .missingAPIKey:    return "API キーが設定されていません。設定画面で入力してください。"
        case .invalidResponse:  return "API のレスポンスを解釈できませんでした。"
        case .http(let code, let body): return "API エラー (\(code)): \(body.prefix(200))"
        case .decoding(let s):  return "AI の出力を解析できませんでした: \(s.prefix(200))"
        case .noText:           return "AI が空の結果を返しました。もう一度試してください。"
        }
    }
}

/// Strongly-typed JSON shape that the model is asked to return.
struct GeneratedWord: Decodable {
    struct Example: Decodable {
        let english: String
        let japanese: String
    }
    struct Synonym: Decodable {
        let word: String
        let meaning: String
        let definitionEnglish: String?
        let useCases: [String]?
        let examples: [Example]?
    }
    let definitionEnglish: String
    let definitionJapanese: String
    let useCases: [String]
    let examples: [Example]
    let synonyms: [Synonym]?
}

struct GeneratedExamples: Decodable {
    let examples: [GeneratedWord.Example]
}

struct TranslationGrading: Decodable {
    /// "correct" / "close" / "incorrect"
    let verdict: String
    /// 0–100 quality score
    let score: Int
    /// A natural English translation (the AI's recommendation)
    let corrected: String
    /// Japanese explanation of what's right/wrong, grammar notes, alternatives.
    let explanation: String

    var isCorrect: Bool { verdict.lowercased() == "correct" }
    var isClose: Bool   { verdict.lowercased() == "close" }
}

/// Calls the Gemini REST API to generate a vocabulary entry from an English word.
/// Uses the `responseMimeType: application/json` + `responseSchema` mode so the
/// model returns parseable JSON every time.
enum GeminiService {
    private static let model = "gemini-2.5-flash"
    private static var endpoint: URL? {
        URL(string: "https://generativelanguage.googleapis.com/v1beta/models/\(model):generateContent")
    }

    /// Regenerates only the example sentences for an existing word, using the
    /// existing definitions as context so the new examples stay on-meaning.
    static func regenerateExamples(for word: Word) async throws -> [GeneratedWord.Example] {
        let prompt = """
        For the English word/phrase "\(word.word)" (meaning: \(word.definitionJapanese.isEmpty ? word.definitionEnglish : word.definitionJapanese)), generate 3 brand-new casual conversation example sentences. Avoid reusing these examples that are already in the user's deck:

        \(word.examples.map { "- \($0.english)" }.joined(separator: "\n"))

        Strict rules:
        - Each example must be everyday spoken English (≤10 words). Contractions like I'm, don't, gonna are encouraged.
        - No formal/news/business register.
        - Vary the situation: at least 2 of the 3 should describe a different scenario from the existing examples.
        - Pair each English sentence with a short, natural Japanese translation.
        - Output JSON only, matching the schema. No markdown, no commentary.
        """

        let schema: [String: Any] = [
            "type": "OBJECT",
            "properties": [
                "examples": [
                    "type": "ARRAY",
                    "items": [
                        "type": "OBJECT",
                        "properties": [
                            "english": ["type": "STRING"],
                            "japanese": ["type": "STRING"]
                        ],
                        "required": ["english", "japanese"]
                    ]
                ]
            ],
            "required": ["examples"]
        ]

        let textData = try await runGenerateContent(
            prompt: prompt,
            schema: schema,
            temperature: 0.6
        )
        do {
            let result = try JSONDecoder().decode(GeneratedExamples.self, from: textData)
            return result.examples
        } catch {
            throw GeminiServiceError.decoding(String(data: textData, encoding: .utf8) ?? "")
        }
    }

    static func generateWord(for word: String) async throws -> GeneratedWord {
        let textData = try await runGenerateContent(
            prompt: buildPrompt(for: word),
            schema: responseSchema,
            temperature: 0.3
        )
        do {
            return try JSONDecoder().decode(GeneratedWord.self, from: textData)
        } catch {
            throw GeminiServiceError.decoding(String(data: textData, encoding: .utf8) ?? "")
        }
    }

    /// Grades the user's English translation of a Japanese example sentence.
    /// The reference English is provided as one valid answer, but the model is
    /// instructed to accept any natural translation that conveys the meaning.
    static func gradeTranslation(
        targetWord: String,
        japanese: String,
        referenceEnglish: String,
        userEnglish: String
    ) async throws -> TranslationGrading {
        let prompt = """
        You are a friendly English teacher grading a Japanese learner's English translation. Be lenient but accurate.

        Target word/phrase the learner is studying: \(targetWord)
        Japanese sentence to translate: \(japanese)
        One valid reference English translation: \(referenceEnglish)
        Learner's translation: \(userEnglish)

        Evaluate and return JSON exactly matching the schema:
        - verdict: "correct" if grammatically fine AND conveys the meaning naturally,
                   "close" if mostly OK but with minor grammar/word-choice issues,
                   "incorrect" if major mistakes that change the meaning or are ungrammatical.
        - score: integer 0–100.
        - corrected: the most natural English translation (you can rephrase the reference).
        - explanation: 必ず日本語で。最大4文程度。良かった点・誤り（文法・語彙・自然さ）・直し方を具体的に。間違いがなければ「自然な訳です」など短く。

        Be tolerant of style differences. Multiple valid translations exist. Don't penalize unless meaning or grammar is broken.

        Output JSON only.
        """

        let schema: [String: Any] = [
            "type": "OBJECT",
            "properties": [
                "verdict": ["type": "STRING"],
                "score": ["type": "INTEGER"],
                "corrected": ["type": "STRING"],
                "explanation": ["type": "STRING"]
            ],
            "required": ["verdict", "score", "corrected", "explanation"]
        ]

        let textData = try await runGenerateContent(
            prompt: prompt,
            schema: schema,
            temperature: 0.2
        )
        do {
            return try JSONDecoder().decode(TranslationGrading.self, from: textData)
        } catch {
            throw GeminiServiceError.decoding(String(data: textData, encoding: .utf8) ?? "")
        }
    }

    /// Shared HTTP transport: returns the raw JSON-text payload Gemini placed in
    /// candidates[0].content.parts[0].text, ready for further `JSONDecoder` use.
    private static func runGenerateContent(
        prompt: String,
        schema: [String: Any],
        temperature: Double
    ) async throws -> Data {
        guard let apiKey = KeychainHelper.get(SecretKey.geminiAPIKey),
              !apiKey.isEmpty else {
            throw GeminiServiceError.missingAPIKey
        }
        guard var components = URLComponents(url: endpoint!, resolvingAgainstBaseURL: false) else {
            throw GeminiServiceError.invalidResponse
        }
        components.queryItems = [URLQueryItem(name: "key", value: apiKey)]
        guard let url = components.url else { throw GeminiServiceError.invalidResponse }

        let body: [String: Any] = [
            "contents": [
                ["parts": [["text": prompt]]]
            ],
            "generationConfig": [
                "temperature": temperature,
                "responseMimeType": "application/json",
                "responseSchema": schema
            ]
        ]

        var req = URLRequest(url: url)
        req.httpMethod = "POST"
        req.addValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try JSONSerialization.data(withJSONObject: body)
        req.timeoutInterval = 30

        let (data, response) = try await URLSession.shared.data(for: req)

        guard let http = response as? HTTPURLResponse else {
            throw GeminiServiceError.invalidResponse
        }
        guard (200..<300).contains(http.statusCode) else {
            let bodyText = String(data: data, encoding: .utf8) ?? ""
            throw GeminiServiceError.http(http.statusCode, bodyText)
        }

        guard let envelope = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
              let candidates = envelope["candidates"] as? [[String: Any]],
              let first = candidates.first,
              let content = first["content"] as? [String: Any],
              let parts = content["parts"] as? [[String: Any]],
              let text = parts.first?["text"] as? String,
              !text.isEmpty,
              let textData = text.data(using: .utf8)
        else {
            throw GeminiServiceError.noText
        }
        return textData
    }

    // MARK: - Prompt + Schema

    private static func buildPrompt(for word: String) -> String {
        """
        You are an English-Japanese vocabulary coach for flashcard-style memorization. Output a JSON object that matches the schema exactly. Keep every field SHORT and easy to memorize.

        Strict style rules:
        - definitionEnglish: ONE very short line (max ~10 words). Plain, memorable wording. No commas-list, no semicolons.
        - definitionJapanese: ONE short line. Core meaning only. 12文字前後を目安。複数の意味は「／」で簡潔に区切る。冗長な補足は書かない。
        - useCases: 2〜3個。各項目は5〜12文字程度の短い体言止めフレーズ。「〜とき」で終わる場面・シチュエーションのみ。文章にしないこと。意味の翻訳や言い換えは禁止。
          OK例: 「会議で意見を出すとき」「友達と予定を決めるとき」
          NG例: 「アイデアや解決策を提案する場面で使う」（長すぎ・説明的）
        - examples: 2〜3個。日常会話で実際に使う、カジュアルで口語的な短い英文（10語以下が目安）。フォーマルな書き言葉やニュース調はNG。短縮形（I'm, don't, gonna 等）OK。各英文に自然で短い日本語訳を付ける。
          OK例: "I came up with a plan." / "Let me figure it out."
          NG例: "The committee has come up with a comprehensive proposal." (堅すぎ・長すぎ)
        - synonyms: もっとも近い類義語を1個だけ、無ければ空配列。本体と同じく短く。各要素 word, meaning（短い日本語）, definitionEnglish（1行）, useCases（1〜2個・短句）, examples（1〜2個・口語）。
        - Output JSON only. No markdown, no extra text.

        Word: \(word)
        """
    }

    private static var responseSchema: [String: Any] {
        [
            "type": "OBJECT",
            "properties": [
                "definitionEnglish": ["type": "STRING"],
                "definitionJapanese": ["type": "STRING"],
                "useCases": [
                    "type": "ARRAY",
                    "items": ["type": "STRING"]
                ],
                "examples": [
                    "type": "ARRAY",
                    "items": [
                        "type": "OBJECT",
                        "properties": [
                            "english": ["type": "STRING"],
                            "japanese": ["type": "STRING"]
                        ],
                        "required": ["english", "japanese"]
                    ]
                ],
                "synonyms": [
                    "type": "ARRAY",
                    "items": [
                        "type": "OBJECT",
                        "properties": [
                            "word": ["type": "STRING"],
                            "meaning": ["type": "STRING"],
                            "definitionEnglish": ["type": "STRING"],
                            "useCases": [
                                "type": "ARRAY",
                                "items": ["type": "STRING"]
                            ],
                            "examples": [
                                "type": "ARRAY",
                                "items": [
                                    "type": "OBJECT",
                                    "properties": [
                                        "english": ["type": "STRING"],
                                        "japanese": ["type": "STRING"]
                                    ],
                                    "required": ["english", "japanese"]
                                ]
                            ]
                        ],
                        "required": ["word", "meaning"]
                    ]
                ]
            ],
            "required": ["definitionEnglish", "definitionJapanese", "useCases", "examples"]
        ]
    }
}
