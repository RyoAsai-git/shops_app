# Shops App

セレクトショップを地図上で探索できるiOSアプリです。MapKitを使用して近くのショップを表示し、お気に入り機能やショップ検索機能を提供します。

## 機能

- 🗺️ **地図表示**: MapKitを使用したインタラクティブな地図
- 🔍 **ショップ検索**: 地図上でショップを検索
- ❤️ **お気に入り機能**: 気に入ったショップをお気に入りに追加
- 🔔 **お知らせ機能**: アプリからの通知を受信
- ⚙️ **設定画面**: アプリの各種設定を管理
- 👤 **ユーザー認証**: AppleログインとGoogleログインに対応

## 技術スタック

- **開発言語**: Swift
- **フレームワーク**: SwiftUI
- **地図**: MapKit
- **位置情報**: Core Location
- **データベース**: Core Data (予定)

## ファイル構成

```
first_app/
├── ContentView.swift                    # メインのタブナビゲーション
├── LoginView.swift                      # ログイン画面
├── first_appApp.swift                   # アプリエントリーポイント
└── Views/
    ├── HomeView.swift                   # ホーム画面 - 地図 + 検索
    ├── FavoritesView.swift              # お気に入り画面
    ├── NotificationsView.swift          # お知らせ画面
    ├── SettingsView.swift               # 設定画面
    └── Components/
        ├── Shop.swift                   # ショップデータモデル
        └── SettingsRow.swift            # 設定項目コンポーネント
```

## 画面構成

### 1. ログイン画面 (`LoginView.swift`)
- Apple ID / Googleアカウントでのログイン
- ログインをスキップしてアプリを開始
- 利用規約・プライバシーポリシーへのリンク

### 2. ホーム画面 (`HomeView.swift`)
- MapKitを使用した地図表示
- ショップ検索バー
- 現在地表示ボタン
- 地図タイプ切り替えボタン
- ショップアノテーション（ピン）

### 3. お気に入り画面 (`FavoritesView.swift`)
- お気に入りに追加したショップ一覧
- ショップ詳細への遷移

### 4. お知らせ画面 (`NotificationsView.swift`)
- アプリからの通知一覧
- 通知バッジ表示

### 5. 設定画面 (`SettingsView.swift`)
- 利用規約
- プライバシーポリシー
- お問い合わせ
- レビューを書く
- ログアウト

## データモデル

### Shop (`Shop.swift`)
```swift
struct Shop: Identifiable {
    let id: UUID
    let name: String
    let coordinate: CLLocationCoordinate2D
    let category: String
}
```

## 開発環境

- **Xcode**: 16.0+
- **iOS**: 17.0+
- **Swift**: 5.9+

## セットアップ

1. リポジトリをクローン
```bash
git clone https://github.com/RyoAsai-git/shops_app.git
cd shops_app
```

2. Xcodeでプロジェクトを開く
```bash
open first_app.xcodeproj
```

3. シミュレーターまたは実機でアプリを実行

## 今後の予定

- [ ] Core Dataを使用したデータ永続化
- [ ] ショップ詳細画面の実装
- [ ] お気に入り機能の実装
- [ ] プッシュ通知機能
- [ ] ユーザー認証の実装
- [ ] ショップレビュー機能
- [ ] フィルタリング機能

## ライセンス

このプロジェクトはMITライセンスの下で公開されています。
