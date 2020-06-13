# README

# 💻 Project Title
## *freemarket_sample_75c*
[![Screenshot from Gyazo](https://gyazo.com/efb0d8057ffc5c77f03620802bbd690e/raw)](https://gyazo.com/efb0d8057ffc5c77f03620802bbd690e)

# 💬 Description
  フリーマーケットサイトのアプリケーションです。  
  誰でも簡単に商品の出品・販売をすることができます。  
  **※実際に取引を行うことはできません。**

  開発チーム人数：4名  
  開発言語：haml,scss,JavaScript,Ruby(Ruby on Rails)  
  開発体制：スクラムを用いたアジャイル開発  
  制作期間：5月20日〜6月10日  

# 🌐 App URL
 - IPアドレス：**http://18.178.241.167**
### Basic認証
 - ID：admin
 - Pass：tech5admin777
### テストユーザー情報
**購入者用アカウント**
 - Email：buyer.sample01@gamil.com
 - Pass：buyer1234

**クレジットカード**
 - 番号：5105105105105100
 - 期限：12月/30年
 - cvcコード：123

**出品者用アカウント**
 - Email：seller.sample01@gmail.com
 - Pass：seller1234

**※上記アカウント以外のユーザーを登録する場合は、登録したメールアドレス宛てにユーザー確認用のメールが届きます。**  
**メール内のURLをクリックすることで、新規登録完了となります。**

# 👤 Development Member
## 岩田 聖大
  < 実装内容 >
 - トップページ作成
 - 商品出品機能
 - 商品出品ページ作成
 - 商品編集機能
 - 商品編集ページ作成

## 瀬戸 彩人
  < 実装内容 >
 - 本番環境デプロイ
 - 商品詳細表示機能
 - 商品詳細ページ作成
 - 質問・コメント機能
 - パンくずリスト表示

## 柏井 麻希
  < 実装内容 >
  - ER図作成
  - トップページ作成
  - 商品削除機能
  - 商品一覧表示機能
  - 商品一覧ページ作成
  - マイページ作成

## 川畑 拓也
  < 実装内容 >
 - ユーザー登録・ログイン機能
 - ユーザー登録・ログインページ作成
 - カテゴリー機能
 - クレジットカード登録機能
 - 商品購入機能

# 📝 ER Diagram
![erd-4_page-0001](https://user-images.githubusercontent.com/63793009/84560640-e190be00-ad80-11ea-8d4b-ad7cc5faf3b9.jpg)

# 🎨 DataBase Disign
## userテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|user_image|string|
|introduction|text|
|last_name|string|null: false|
|first_name|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|birth_day|date|null: false|

### Association
 - has_many :items    dependent: :destroy
 - has_many :comments dependent: :destroy
 - has_one :address   dependent: :destroy
 - has_one :card      dependent: :destroy


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|lastname_kana|string|null: false|
|firstname_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel_number|string|
|user|references|null: false, foreign_key:true|

### Association
 - belongs_to :user
 - belongs_to_active_hash :prefecture


## cardテーブル #payjp
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false|
|customer_id|string|null: false|
|user|references|null:false, foreign_key: true|

### Association
 - belongs_to:user


## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
 - has_many :items


##  itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null:false|
|introduction|text|null: false|
|status|string|null: false|
|size|string|null: false|
|shipping_cost|string|null: false|
|shipping_days|string|null: false|
|prefecture_id|string|null: false|
|category|references|null: false, foreign_key: true
|brand|references|null: false, foreign_key: true|
|buyer|integer|foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
 - belongs_to :user
 - belongs_to :category
 - belongs_to :brand
 - has_many :images dependent: :destroy
 - has_many :comments dependent: :destroy
 - belongs_to_active_hash :prefecture


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item|references|null: false, foreign_key: true|

### Association
 - belongs_to :item


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: true|
|item|references|

### Association
 - belongs_to :items
