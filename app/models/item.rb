class Item < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  belongs_to :category
  has_one :brand, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :brand, allow_destroy:true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  accepts_nested_attributes_for :images, allow_destroy:true

  validates :name,           presence: true
  validates :price,          presence: true
  validates :introduction,   presence: true
  validates :status,         presence: true
  validates :size,           presence: true
  validates :shipping_cost,  presence: true
  validates :shipping_days,  presence: true
  validates :prefecture_id,  presence: true
  validates :user_id,        presence: true
  validates :category_id,    presence: true
  validates :images, length: {minimum: 1, maximum: 10}
  enum buyer: { sell: 0, buy: 1}
  scope :on_sell, -> { where(buyer: 0) }


  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
  enum prefecture:{
    北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
    徳島県:36,香川県:37,愛媛県:38,高知県:39,
    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
  }

  enum status:   { brand_new: "1", near_to_unused: "2", no_scrach: "3", slight_scrach: "4", has_scrach: "5", bad_state: "6" }
  enum shipping_cost:  { listing_person: "1", buyer_burden: "2" }
  enum shipping_days:    { early_ship: "1", mid_ship: "2", late_ship: "3" }
  enum size:  {S: "1", M: "2", L: "3", LL: "4" }
end