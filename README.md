# FoudationModelTest_RS

このプロジェクトは Apple の Foundation Model を試すアプリです。

> 注意: プロジェクト名および本文中の "Foudation" は元のプロジェクト名に合わせています。必要に応じて "Foundation" に修正してください。

---

## プロジェクト概要
- 目的: Apple の Foundation Model（Apple Intelligence / Foundation Models フレームワーク等）を用いた試験的実装
- プラットフォーム: iOS（他プラットフォーム対応があれば追記）
- 主な技術スタック:
  - Swift / SwiftUI
  - Foundation Models（オンデバイス LLM など）
  - 必要に応じて StoreKit, AppIntents, etc.

## 学習目標
- [x] Foundation Model の基本的な使い方を理解する (9/17完了)
- [] #PlayGroundマクロの利用方法を理解する
- [] Guided Generationを利用して、LLMの回答の形を決める
- [] 回答のストリーミング配信をさせてみる
- [] Tool Callingを利用して、別のフレームワークと連携してみる

## 実装メモ（テンプレート）

### [9/17] チャットアプリ
- 背景 / 目的:
  - Foundation Model の簡単な動作確認
- 参考資料:
  - [【WWDC25】iPhoneだけでLLM⁉︎ Foundation Modelsを“3行”で動かしてみた](https://qiita.com/takatein/items/fa28aa4ace902fd7a7cc)
- 実装ポイント / 気づき:
  - なぜかAIのレスポンスに失敗？するとAppleのリンクを紹介される
  - LLMが有効か確認が必要
- コードスニペット:
  ```swift
  // LLMが利用可能か確認
  guard SystemLanguageModel.default.availability == .available else { return }
  // ユーザの入力に対して、AIでレスポンスを返す
  let response = try await session.respond(to: userInput)
  output = response.content          // ← .content で文字列を取得
  ```

### [9/17] モチベーションアプリ
- 背景 / 目的:
  - Foundation Model の簡単な動作確認2
- 参考資料:
  - [【爆速Swift FoundaionModels入門！ローカルでLLMが動くよ。 WWDC2025（動画解説ver.）](https://qiita.com/kuroishihiromu/items/747671bc87fe19d183ea#playgrounds%E3%82%92%E4%BD%BF%E3%81%8A%E3%81%86)
- 実装ポイント / 気づき:
  - View, Modelの分離
- コードスニペット:
  特になし

<!--
## 実装メモ（テンプレート）
学んだことを継続的に追記するためのテンプレートです。必要に応じて複製して使ってください。

### [9/17] トピック名
- 背景 / 目的:
  - 何を達成したいか、どんな課題があったか
- 参考資料:
  - [リンクタイトル](URL)
  - メモ（動画やセッション番号など）
- 実装ポイント / 気づき:
  - 箇条書きで要点を短く
  - API の制約やベストプラクティス
- コードスニペット:
  ```swift
  // 関連する最小コード例を貼る
  // func example() { ... } 
  ```
-->
