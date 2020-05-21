# README

# DataBase Disign

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
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|

### Association
 - has_many :items dependent: :destroy
 - has_one :address dependent: :destroy
 - has_one :card dependent: :destroy


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
|category|references|null: false, foreign_key: true|	
|brand|references|null: false, foreign_key: true|
|buyer|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association 
 - belongs_to :user 
 - belongs_to :category
 - belongs_to :brand
 - has_many :images dependent: :destroy
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

### Association
 - has_many :items


Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
