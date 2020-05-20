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
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_manth|integer|null: false|
|birth_day|integer|null: false|

### Association
 - has_many :items dependent: :destroy
 - belongs_to :address dependent: :destroy
 - belongs_to :card dependent: :destroy


## addressテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false| 
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|
|tel_number|string|
|user|reference|null: false, foreign_key:true|

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
#gem-ancestry使用

### Association
 - has_many :items
※ancdestryは、gem ancestryを使用するため		


##  itemsテーブル
|Column|Type|Options|
|------|----|-------|
|image|referemce|null: false, foreign_key: true| 
|name|string|null: false|
|price|integer|null:false|
|introduction|text|null: false|
|status|string|null: false|
|size|string|null: false| 	
|shipping_cost|string|null: false|
|shipping_days|string|null: false|
|prefecture_id|string|null: false|
|category|reference|null: false, foreign_key: true|	
|brand|reference|null: false, foreign_key: true|
|buyer|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association 
 - belongs_to :user dependent: :destroy
 - belongs_to :category dependent: :destroy
 - belongs_to :brand dependent: :destroy
 - has_many :images dependent: :destroy 
 - belongs_to_active_hash :prefecture 


## imageテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|items|reference|null: false, foreign_key: true|

### Association
 - belongs_to :items


## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|index: ture|

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
