# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
rails 5.2.4
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

最初にアイキャッチ画像などを表示

# リポジトリ名
このソフトはどんなもので、何ができるのかを書く
合わせて、簡単なデモ（使用例）などスクリーンショットやGIFアニメで表示
*顧客側と管理者側の2方向から操作できるECサイト
*管理者側からは商品の新規投稿、販売停止等のステータス管理が可能
*顧客側からはログイン後選んだ商品を注文する事できる


## Dependency
使用言語とバージョン、必要なライブラリとそのバージョンを書く
Pythonならrequirements.txtを用意する

*使用言語　
HTML　ruby

*gem
gem 'devise'
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
gem 'bootstrap', '~> 4.5'
gem 'jquery-rails'
gem 'font-awesome-sass', '~> 5.13'
gem 'jp_prefecture'
gem 'kaminari','~> 1.2.1'
gem 'data-confirm-modal'

## Setup
セットアップ方法を書く。用意するハードウェアとソフトウェアをセットアップするためのコマンドを記載する

## Usage
使い方。なるべく具体的に書く。サンプルも書く
顧客側

商品自体は誰でも閲覧可能。
しかし注文を行う場合は任意のユーザ名やメールアドレスでサインアップ後、
注文商品と注文個数の指定を行い支払い方法、配送先の指定を行う必要がある

管理者側
管理者専用のパスワード、メールアドレスを利用しログイン
管理者側から商品の新規投稿、製品ステータスの管理、顧客からの注文を閲覧する事ができる。
またステータス管理により、注文した商品は今どのステータスなのか顧客側からも把握できるように


## License
This software is released under the MIT License, see LICENSE.

## Authors
加藤一隼
柴秀樹
寺島早紀

## References
参考にした情報源（サイト・論文）などの情報、リンク
*https://pikawaka.com/rails/form_with
*https://qiita.com/qz7_start/items/cbae7741a7dde5248ec6
*https://pikawaka.com/rails/count