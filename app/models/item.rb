class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :category

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
end
