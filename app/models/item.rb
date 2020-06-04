class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :category
  has_one :brand
  has_many :comments

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

  enum buyer: { sell: 0, buy: 1}
  scope :on_sell, -> { where(buyer: 0) }


  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end
end
