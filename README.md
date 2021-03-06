# FloorManagement

## 概要

飲食店などにおいて重要事項である、現在の席情報や予約情報、顧客情報を管理できる。   
誰でも簡単に使えるよう、なるべくシンプルに作成する。  

URLはこちら  
https://floor-management.herokuapp.com/  

サンプルはこちらのアカウントでログインしてください。   
__Email__: sample@gmail.com  
__Password__: 11111111

## 作成の目的

学んだことを使って現在の仕事を効率化する方法として作成。  
現在の仕事と絡めることで自身のイメージするものを作るために足りない点などを確認する。  
全くのゼロから自力でアプリケーションを作ることで理解を深める。  

## サンプル画像

[![Image from Gyazo](https://i.gyazo.com/6ee393ce3398e36dd22eb5f2f1dfae89.png)](https://gyazo.com/6ee393ce3398e36dd22eb5f2f1dfae89)
## できること

- 任意のテーブルの作成、削除
- 使用中のテーブルクリックで色を変えることで常に確認できる
- 予約の登録、検索
- 顧客情報の検索
- 予約情報をテーブルに反映

## 工夫した点、苦労した点

- 登録された予約情報をテーブルから削除する際に顧客情報として残せるよう削除ではなく編集にした。
- 全くのゼロベースで開発するのが初めてだったのでマークアップから始めることでDB設計のイメージを明確にすることができた。
- 顧客情報をインクリメンタルサーチを使って効率よく検索できるようにした。
- デザインや機能をなるべくシンプルにすることでユーザビリティを高めるよう心がけた。
- cookieを使用して着席情報を保持できるようにした。

## 今後の修正点、追加点

- 全体的なレイアウトをよりシンプルでキャッチーなものにする。
  →適宜修正中
- 現在の席情報(クリックして変更した色)を画面が遷移しても保持できるようにする。
  →修正済み
- 携帯用のレイアウトも持たせる事でより使用の幅を広げる。
- 自動更新機能をつける事で常に最新の状態を保つ。(管理者が離れた位置から常に確認できる)
- 予約情報の扱いをもっとシンプルなものに。（ワンクリックで削除できるなど）