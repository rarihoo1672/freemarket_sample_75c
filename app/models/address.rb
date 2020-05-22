class Address < ApplicationRecord
  belongs_to :user

  validates :last_name,      presence: true
  validates :first_name,     presence: true
  validates :lastname_kana,  presence: true
  validates :firstname_kana, presence: true
  validates :post_code,      presence: true
  validates :prefecture,     presence: true
  validates :city,           presence: true
  validates :address,        presence: true
  validates :user_id,        presence: true
end
