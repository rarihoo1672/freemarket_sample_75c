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
**http://18.178.241.167**
### Basic認証
 - ID：admin
 - Pass：tech5admin777
### テストユーザー情報
**購入者用アカウント**
 - Email：buyer75c@gmail.com
 - Pass：buy1234

**クレジットカード**
 - 番号：4242424242424242
 - 期限：12月/30年
 - cvcコード：123

**出品者用アカウント**
 - Email：seller75c@gmail.com
 - Pass：sell1234

**※上記アカウント以外のユーザーを登録する場合は、登録したメールアドレス宛てにユーザー確認用のメールが届きます。**  
**メール内のURLをクリックすることで、新規登録完了となります。**

# 👤 Development Member
## 岩田 聖大
  実装内容：

## 瀬戸 彩人
  実装内容：

## 柏井 麻希
  実装内容：

## 川畑 拓也
  実装内容：

# 📝 ER Diagram


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
