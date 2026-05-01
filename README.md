# English Vocab App (Xcode / SwiftUI)

エビングハウスの忘却曲線に基づいて英単語を復習するための、自分用 iOS アプリです。SwiftUI / Xcode ネイティブで作成されています。

## 機能

- 📱 SwiftUI 製のネイティブ iOS アプリ（Xcode で開く）
- 🧠 エビングハウス忘却曲線ベースの復習スケジュール
- ◎ ／ △ ／ × の3段階ボタンで自己評価
- ➕ アプリ内から英単語を追加可能（1単語ずつ、好きなだけ）
- 🔍 単語帳（一覧・検索・削除・詳細表示）
- 💾 ローカル（端末内 Documents/words.json）に永続保存

## 復習スケジュールのルール

ユーザー仕様どおり、以下の3段階で次回復習日を決定します。

| ボタン | 意味 | 次回復習 |
|:-:|:-|:-|
| ◎ | 覚えた | **3か月後**（90日後）に再出題 |
| △ | 忘れそう | **1週間後**（7日後）に再出題 |
| × | 覚えてない | **翌日**（1日後）に再出題 |

エビングハウス忘却曲線の各段階（1日後 / 3日後 / 1週間後 / 1か月後 / 2か月後 / 3か月後 → 以後ずっと3か月後）はモデル側に enum として定義されているため、将来的にプログレッシブな段階遷移ロジックに切り替えることもできます（`Models.swift` の `EbbinghausStage`）。

## 出題フォーマット

復習画面では、追加された各単語は以下のフォーマットで自動的に表示されます。

```
<英単語>
■ 英語の定義
  <English definition> → <日本語訳>
■ 使う場面
  ・<シーン1>
  ・<シーン2>
■ 例文
  1. <English> → <日本語>
  2. ...
■ 類義語
  <類義語>（<意味>）
   • <例文 EN> → <例文 JA>
[ ◎ 覚えた ] [ △ 忘れそう ] [ × 覚えてない ]
```

シードデータとして `thread` と `spokesman` の2語が組み込まれています。

## 起動方法

1. macOS で Xcode 15 以上を開く
2. `EnglishVocabApp/EnglishVocabApp.xcodeproj` を開く
3. 上部のスキームから **EnglishVocabApp** を選択
4. シミュレータまたは実機を選んで ⌘R で実行

> ⚠️ 実機で動かす場合は、Xcode の **Signing & Capabilities** タブで自分の Apple ID（Team）を選択し、Bundle Identifier を `com.<あなた>.EnglishVocabApp` などユニークなものに変更してください。

## 単語の追加方法

アプリ内の「追加」タブからフォームに入力するだけで、新しい単語が単語帳と復習対象に追加されます。入力欄は次の構成です。

- 英単語
- 英語の定義 / 日本語訳
- 使う場面（1行に1つ）
- 例文（英語 + 日本語訳） … 例文は何個でも追加可能
- 類義語（語 + 意味 + 例文） … 類義語ごと・例文ごとに追加可能

追加された単語は即座に保存され、当日から復習対象になります。

## 開発ブランチ

`claude/english-vocab-app-YCZhY`

## ファイル構成

```
EnglishVocabApp/
├── EnglishVocabApp.xcodeproj/
└── EnglishVocabApp/
    ├── EnglishVocabAppApp.swift   # @main エントリポイント
    ├── ContentView.swift          # TabView ルート
    ├── Models.swift               # Word / ExampleSentence / SynonymGroup / EbbinghausStage / ReviewMark
    ├── WordStore.swift            # 永続化 + 復習スケジュール計算
    ├── ReviewView.swift           # ◎△× ボタン付き復習画面
    ├── AddWordView.swift          # 単語追加フォーム
    ├── WordListView.swift         # 単語一覧 + 詳細
    ├── Assets.xcassets/
    └── Preview Content/
```

## ライセンス

MIT
