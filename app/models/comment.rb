class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :message, presence: true,
            length: { maximum: 35 }
end
