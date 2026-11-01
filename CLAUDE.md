# 定期タスク（1時間ごとの英語表現追加）について

追加先はこのブランチの `data/words.json` **ではありません**。

- 追加先ブランチ: `claude/english-vocab-app-YCZhY`（SwiftUI の英語アプリ）
- ファイル: `EnglishVocabApp/EnglishVocabApp/SeedData.swift`
- 方法: `private static var britishColloquialNN: [Word]`（NNは連番、70の次は71）の新バッチを
  `make(...)` 形式（英語定義・日本語・useCases・例文2つ・英国式IPA）で追加し、
  `additionalWords` の連結リスト末尾に `+ britishColloquialNN` を足す
- 追加前に `grep -oP '^\s+make\("\K[^"]+' SeedData.swift` で既存表現との重複を確認する
- 内容: ヨーロッパ（主にイギリス）のネイティブが会話で使う口語表現を15個
- コミット後 `git push -u origin claude/english-vocab-app-YCZhY`
