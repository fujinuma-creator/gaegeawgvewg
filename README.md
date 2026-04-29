# English Vocab App

英単語を効率的に復習するiPhoneアプリです。エビングハウスの忘却曲線に基づいた復習スケジュール機能を搭載しています。

## 機能

- 📱 iPhone対応（React Native + Expo）
- 🎯 ランダム単語表示
- 📅 エビングハウス忘却曲線復習スケジュール
- 💾 ローカルストレージに進捗保存
- 📊 復習統計情報表示

## 復習スケジュール

3段階ボタンで復習日を自動管理：

- **〇 覚えた** → 2か月後（60日後）に復習
- **△ 忘れそう** → 1週間後（7日後）に復習
- **× 覚えてない** → 1日後に復習

## セットアップ

### 1. 依存関係をインストール

```bash
npm install
```

### 2. AsyncStorageをインストール

```bash
npm install @react-native-async-storage/async-storage
```

### 3. アプリを起動

```bash
npm start
```

### 4. iPhoneで実行

1. iPhoneに「Expo Go」アプリをインストール
2. ターミナルに表示されたQRコードをスキャン
3. アプリが起動します！

## 単語を追加する

`data/words.json` に新しい単語を追加してください。

```json
{
  "id": "9",
  "word": "単語",
  "definition": "英語での定義",
  "japanese": "日本語",
  "useCase": "使う場面",
  "examples": [
    "例文1",
    "例文2",
    "例文3"
  ],
  "synonyms": [
    "類義語1",
    "類義語2"
  ]
}
```

## 目安

- 1日20分で約200個のペースに最適化
- 毎日アプリを開くと、その日に復習すべき単語がランダムに表示されます

## 使用技術

- React Native
- Expo
- TypeScript
- AsyncStorage

## ライセンス

MIT
