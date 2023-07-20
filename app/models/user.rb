class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 50 }
  validates :nickname, presence: { message: "Veuillez saisir un pseudonyme" }
end
