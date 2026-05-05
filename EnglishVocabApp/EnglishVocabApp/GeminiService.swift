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
        /// Japanese grammar / usage explanation for this sentence.
        /// Optional because some older AI calls didn't include it.
        let grammar: String?
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
        For the English word/phrase "\(word.word)" (meaning: \(word.definitionJapanese.isEmpty ? word.definitionEnglish : word.definitionJapanese)), write 3 brand-new example sentences that sound like real things a native English speaker would say in everyday situations — chatting with a friend, dealing with a tech problem, asking a question to support, talking about plans, etc. Avoid these examples already in the user's deck:

        \(word.examples.map { "- \($0.english)" }.joined(separator: "\n"))

        Native-speaker rules (strict):
        - Roughly 5–15 words each. Real, situational, not cookie-cutter.
        - Heavy contractions: I'm, you're, it's, don't, won't, gonna, wanna, kinda, gotta, can't, we'll.
        - Use natural verbal phrasings and collocations: "stuck on …", "swap out X for Y", "set to …", "any way to …?", "kicked off …", "ran into … with …", "ended up …", "kinda".
        - Mix discourse markers when they fit: "honestly", "actually", "I mean", "like", "you know".
        - Mix sentence types: at least one of the three should be a question or request, or a fragment / exclamation.
        - Each example should sit in a different real-life scene (e.g. an account/region issue, a phone or laptop hiccup, weekend plans with friends, asking support for help, swapping items, work standup chat).
        - Avoid translation-textbook English. NO: "I have decided to take it." / "It is necessary that we...". YES: "I'm gonna take it." / "We kinda have to."
        - Native conversational anchors to imitate the *register* of:
          • "My account is currently set to Singapore."
          • "The region on my dev account is stuck on Singapore."
          • "Is there any way to update my country/region?"
          • "Can I swap out my phone number for a Japanese one?"
        - Pair each English sentence with a short, natural Japanese translation in casual spoken style (「〜なんだ」「〜してくれる？」「〜だよね？」 OK).
        - Each example must also include a "grammar" field: 必ず日本語で、その英文の文法・語法・コロケーションを2〜4個の箇条書き（行頭は「・」）で具体的に解説。時制・冠詞・前置詞・助動詞・代名詞などについて「なぜその形か」を説明する。
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
                            "japanese": ["type": "STRING"],
                            "grammar": ["type": "STRING"]
                        ],
                        "required": ["english", "japanese", "grammar"]
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
        - examples: 2〜3個。各要素は english / japanese / grammar の3フィールド。
          ・english: ネイティブが実際の生活で使う、状況がリアルに感じられる自然な口語英文（だいたい5〜15語）。
            雰囲気の目安: アカウント設定の不具合をエンジニア仲間に相談する／カフェで友達に最近の悩みをこぼす／海外サポートに気軽に質問する、そんな感じの普段の発話。
            必須: 短縮形を積極的に使う（I'm, you're, it's, don't, won't, gonna, wanna, kinda, gotta, can't）。
            自然な動詞句・コロケーションを使う: "stuck on …", "swap out … for …", "set to …", "kicked off the meeting", "ran into trouble with …", "any way to …?", "ended up doing …"。
            自然なディスコースマーカー混入OK: honestly / actually / kinda / totally / I mean / like。
            疑問文・依頼文・気持ちの吐露・短い断片もOK。文末ピリオドがなくても可（語尾が "?", "!"）。
            文脈は毎回違うシーンから（仕事の困りごと、買い物、家族の予定、技術トラブル、外食、SNS、旅行など）。
            ❌ 翻訳教科書調・ニュース調・ビジネス文書調はNG: "The committee has come up with a comprehensive proposal." / "I have decided to take it."
            ✅ ネイティブ口語のお手本イメージ:
              - "My account is currently set to Singapore."
              - "The region on my dev account is stuck on Singapore."
              - "Is there any way to update my country/region?"
              - "Can I swap out my phone number for a Japanese one?"
              - "Honestly, I'm gonna go for it."
              - "Wait, you really think so?"
              - "Let me figure it out before I bug support."
          ・japanese: 短く自然な日本語訳。くだけた口語OK（「〜なんだ」「〜だよね？」「〜してくれる？」など）。
          ・grammar: 必ず日本語で。その英文の文法・語法・コロケーションを2〜4個の箇条書き（行頭は「・」）で簡潔に解説。なぜその時制・冠詞・前置詞・助動詞・代名詞かを具体的に説明する。
            例: 「・"I've decided" は現在完了形。過去の決断が今も有効であることを示す。"I decided" だと過去の一回の事実だけ。」「・"to take" は to不定詞。decide は to不定詞のみと結びつく。」
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
                            "japanese": ["type": "STRING"],
                            "grammar": ["type": "STRING"]
                        ],
                        "required": ["english", "japanese", "grammar"]
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
