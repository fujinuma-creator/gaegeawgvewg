import Foundation

/// Hand-curated 4-choice grammar questions. Add new entries to
/// `questions` over time — IDs must remain stable so user progress
/// (which choice they picked) keeps mapping to the right question.
enum GrammarMCQSeed {

    static let questions: [GrammarQuestion] = [
        // 問題は一旦削除済み。新しい問題を追加するときは、
        // ここに GrammarQuestion(...) を append してください。
        // ID は q01, q02, ... のように一意で安定したものを使うと、
        // 既存ユーザーの解答記録(grammar_answers.json)と整合します。
    ]
}
