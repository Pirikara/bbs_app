# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# アプリケーション情報
### アプリケーション概要
Web掲示板アプリケーションサービスです。

### 接続先情報
URL：https://openbbs-sample.herokuapp.com/
TEST ACCOUNT: Email a@example.com
              Pass 1111aaaa
### 使用技術
Ruby / Ruby on Rails / MySQL / Github / Heroku / VS Code / Docker / CircleCI

# 設計詳細
### 実装したWebアプリの設計図
<img width="608" alt="スクリーンショット 2020-02-21 7 06 52" src="https://user-images.githubusercontent.com/56626350/74984851-b30d7100-5479-11ea-897a-1691453cbeca.png">

# 機能詳細
### DB設計
<img width="1114" alt="スクリーンショット 2020-02-21 7 13 11" src="https://user-images.githubusercontent.com/56626350/74984961-e51ed300-5479-11ea-8e77-f44c0acb1f0b.png">

### ログイン機能
Topページ右上にログイン・新規登録のナビゲーションがあります。
[![Image from Gyazo](https://i.gyazo.com/7c08e063913010e59ae26da059f0063f.gif)](https://gyazo.com/7c08e063913010e59ae26da059f0063f)

### マイページ機能
ログイン後、右上のナビゲーションからマイページに移動することができます。
「HOSTROOM」は自分が作成したトークルーム一覧、「GESTROOM」は自分がメッセージを送ったことのあるトークルーム一覧です。
「HOSTROOM」は編集・削除が可能です。
また、画面下部のリンクからユーザーアカウントの編集・削除も可能です。
[![Image from Gyazo](https://i.gyazo.com/61b20948fb174735051342b699db2a28.gif)](https://gyazo.com/61b20948fb174735051342b699db2a28)

### 投稿機能
ログイン後、右上のナビゲーションから新規投稿画面に移動できます。
タイトル・説明・カテゴリを選択することでトークルームを作成できます。
画像も設定できますが、必須ではありません。設定しなければデフォルトの画像が表示されます。
[![Image from Gyazo](https://i.gyazo.com/4a1db35ceffdbf4ca431aed5d0e826f2.gif)](https://gyazo.com/4a1db35ceffdbf4ca431aed5d0e826f2)

### チャット機能
投稿することで、トークルームへリンクします。
ルームを作成について初期メッセージで送られます。
[![Image from Gyazo](https://i.gyazo.com/50eb0e39b14b0df5edc1473aeff6c891.gif)](https://gyazo.com/50eb0e39b14b0df5edc1473aeff6c891)

自分が送ったメッセージは右に、その他のメッセージは左に配置されます。
非同期通信は現状対応していませんが、ページへのアクセス時に自動で最新メッセージ部までスクロールします。
[![Image from Gyazo](https://i.gyazo.com/f7b33b7670d2a39a5f44ca2a7572cb2e.gif)](https://gyazo.com/f7b33b7670d2a39a5f44ca2a7572cb2e)

### カテゴリ機能
トップページのカテゴリ一覧から格カテゴリにひもづくトークルームを検索できます。
[![Image from Gyazo](https://i.gyazo.com/39c4ff5f2822e6036f84db80d2cde806.gif)](https://gyazo.com/39c4ff5f2822e6036f84db80d2cde806)

### 検索機能
トップページの検索フォームから、単語で検索することができます。
Roomモデルに紐づくMessageに対して、LKE句検索をするよう実装しています。
キーワードに該当するメッセージを含むトークルームが検索結果となります。
トークルーム作成時にタイトルを含むファーストメッセージが送られるため、トークルームのタイトルも検索対象となります。
[![Image from Gyazo](https://i.gyazo.com/41ecef3afe9656aab91230dedc923fef.gif)](https://gyazo.com/41ecef3afe9656aab91230dedc923fef)