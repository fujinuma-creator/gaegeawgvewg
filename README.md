# Chinese Vocab App (iOS / SwiftUI)

中国語の単語を効率的に復習する iPhone アプリです。エビングハウス忘却曲線に基づいた復習スケジュール機能を搭載しています。
同リポジトリ内の React Native 版 (`App.tsx`) のデザイン・構成を参考にしています。

## 機能

- iPhone / iPad 対応 (SwiftUI, iOS 17+)
- ランダム単語表示
- エビングハウス忘却曲線復習スケジュール
- ローカルストレージ (UserDefaults) に進捗保存
- 復習統計情報表示
- 漢字 / 拼音 (pinyin) / 日本語訳 / 利用シーン / 例文 / 類義語

## 復習スケジュール

3段階ボタンで次回復習日を自動管理：

- **〇 覚えた** → 60日後に復習
- **△ 忘れそう** → 7日後に復習
- **× 覚えてない** → 1日後に復習

## 構成

```
ChineseVocabApp.xcodeproj/
ChineseVocabApp/
  ├── ChineseVocabAppApp.swift   # アプリ エントリポイント
  ├── ContentView.swift          # ヘッダー / 統計 / ルートレイアウト
  ├── WordCardView.swift         # 単語カード
  ├── CompletedView.swift        # 全復習完了時の画面
  ├── Models.swift               # Word / ReviewData / ReviewResult
  ├── WordStore.swift            # 状態管理 + 永続化
  ├── words.json                 # 中国語単語データ
  └── Assets.xcassets / Preview Content/
```

## セットアップ

1. `ChineseVocabApp.xcodeproj` を Xcode 15 以降で開く
2. iPhone シミュレータ（iOS 17+）を選択
3. Run

## 単語を追加する

`ChineseVocabApp/words.json` に下記の形式で追加してください。

```json
{
  "id": "21",
  "word": "你好",
  "pinyin": "nǐ hǎo",
  "japanese": "こんにちは",
  "definition": "出会ったときの最も一般的な挨拶",
  "useCase": "日常の挨拶",
  "examples": [
    "你好，我叫小明。 (こんにちは、私はシャオミンです)"
  ],
  "synonyms": [
    "您好 (nín hǎo) — 丁寧な「こんにちは」"
  ]
}
```

## 目安

- 1日 20 分で約 200 単語ペースに最適化
- 毎日アプリを開くと、その日に復習すべき単語がランダムに 1 つ表示されます

## 使用技術

- Swift 5 / SwiftUI
- iOS 17+
- UserDefaults

## 参考: React Native 版

`App.tsx`, `data/words.json` は元の React Native + Expo 版のソースで、本 iOS アプリのデザイン参考用に残されています。

## ライセンス

MIT
