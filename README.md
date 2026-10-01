# English Vocab App (Xcode / SwiftUI)

エビングハウスの忘却曲線に基づいて英単語を復習するための、自分用 iOS アプリです。SwiftUI / Xcode ネイティブで作成されています。

## 機能

- 📱 SwiftUI 製のネイティブ iOS アプリ
- 🃏 **カード**タブ：本日の復習リストを HTML モック準拠のカード UI で表示
- ❓ **クイズ**タブ：英単語 → 日本語の意味を4択クイズで復習
- 📚 **一覧**タブ：全単語の検索・フィルタ・展開表示・追加・削除
- 🧠 復習回数を記録し、エビングハウス忘却曲線で自動再出題
- 🎚️ ◎完璧 / △あいまい / ×わからない の3段階ボタン＋スワイプ操作
- 🔊 単語・例文・定義の英語をタップで読み上げ（AVSpeechSynthesizer）
- 💾 端末内 Documents/words.json に永続保存

## 復習スケジュール

ユーザー指定のエビングハウス忘却曲線に従って、`◎ 完璧`を押すと復習回数がインクリメントされ、次回出題日が自動計算されます。

| 完了した復習回数 | 次回出題 |
|:-:|:-:|
| 1回目完了 | **1日後** |
| 2回目完了 | **3日後** |
| 3回目完了 | **2週間後** |
| 4回目完了 | **1ヶ月後** |
| 5回目以降 | **2ヶ月後**（永遠に2ヶ月） |

その他のボタン:
- **△ あいまい** … カウントは変えず、1週間後に再出題
- **× わからない** … カウントを **0 にリセット**、翌日に再出題

スワイプ操作:
- **右スワイプ** = ◎ 完璧
- **左スワイプ** = × わからない
- **△ あいまい** はボタンのみ

各単語には「**復習回数**」が記録され、画面下部とリスト詳細で確認できます。

## ステータス

| ステータス | 条件 |
|:-:|:-|
| 未習得（グレー） | まだ一度も評価していない / 直近で × |
| あいまい（オレンジ） | 直近で △ |
| 完璧（インディゴ） | 直近で ◎ |

## 出題フォーマット

カードタブでは以下のフォーマットで表示されます。

```
[🔊]                                 [未習得 / あいまい / 完璧]

英単語（大）
日本語訳（小）
─────────────
■ 英語の定義
   🔊 a thin strand used for sewing; ...

■ 使う場面
   ・裁縫の糸
   ・SNSの投稿の流れ
   ・話の流れ

■ 例文
   🔊 Use this thread to sew.
       この糸で縫って。
   …

■ 類義語
   ┌─────────────────────────────┐
   │ 🔊 string  ひも              │
   │ 英語の定義: a thin, twisted ...│
   │ 使う場面: 物を縛るとき など      │
   │ 🔊 Tie it with a string.     │
   │     ひもで結ぶ。               │
   └─────────────────────────────┘

[× わからない] [△ あいまい] [◎ 完璧]
```

シードデータとして以下の単語を組み込み済みです:
`thread` / `spokesman` / `speaker` / `box` / `a bunch of` / `playful`

## 起動方法

1. macOS で Xcode 15 以上を開く
2. `EnglishVocabApp/EnglishVocabApp.xcodeproj` を開く
3. **Signing & Capabilities** タブで Team を選択し、Bundle ID をユニークなものに変更
4. 上部のスキームから **EnglishVocabApp** を選択
5. シミュレータまたは実機を選んで ⌘R で実行

## 単語の追加方法

「一覧」タブの右下にある **＋ボタン**をタップすると追加フォームが開きます。入力欄:

- 英単語
- 英語の定義 / 日本語訳
- 使う場面（1行に1つ）
- 例文（英語 + 日本語訳） … 何個でも追加可能
- 類義語（語 + 意味 + 英語の定義 + 使う場面 + 例文） … 何個でも追加可能

追加された単語は即座に保存され、当日から復習対象になります。

## ファイル構成

```
EnglishVocabApp/
├── EnglishVocabApp.xcodeproj/
└── EnglishVocabApp/
    ├── EnglishVocabAppApp.swift   # @main エントリポイント
    ├── ContentView.swift          # TabView (カード / クイズ / 一覧)
    ├── Models.swift               # Word / SynonymGroup / WordStatus / ReviewMark / 間隔計算
    ├── WordStore.swift            # 永続化 + 復習回数ベースのスケジューリング
    ├── SpeechManager.swift        # AVSpeechSynthesizer のラッパー（TTS）
    ├── ReviewView.swift           # カードタブ：スワイプ + ◎△× ボタン
    ├── QuizView.swift             # クイズタブ：4択クイズ
    ├── WordListView.swift         # 一覧タブ：検索 + フィルタ + 展開
    ├── AddWordView.swift          # 単語追加フォーム
    ├── Assets.xcassets/
    └── Preview Content/
```

## 開発ブランチ

`claude/english-vocab-app-YCZhY`

## ライセンス

MIT
