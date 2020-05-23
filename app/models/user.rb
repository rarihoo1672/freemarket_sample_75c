class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :confirmable, :lockable

  validates :nickname,       presence: true
  validates :last_name,      presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+$\z/ }
  validates :first_name,     presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+$\z/ }
  validates :lastname_kana,  presence: true, format: { with: /\A([ァ-ン]|ー)+$\z/ }
  validates :firstname_kana, presence: true, format: { with: /\A([ァ-ン]|ー)+$\z/ }
  validates :birth_day,      presence: true
  validates :email,          presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9_\#!$%&`'*+\-{|}~^\/=?\.]+@[a-zA-Z0-9][a-zA-Z0-9\.-]+\z/ }
  validates :password,       presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i }

  has_many :items
  has_one :address
end
