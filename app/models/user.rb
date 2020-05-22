class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable

  with_options presence: true do
    validates :nickname
    validates :last_name
    validates :first_name
    validates :lastname_kana
    validates :firstname_kana
    validates :birth_day
  end

  validates :email, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/ }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /\A[a-zA-Z]\d\z/ }
  validates :password, presence: true, length: { minimum: 7 }, format: { with: /\A[a-zA-Z]\d\z/ }

  has_many :items
  has_one :address
end
