class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 50 }
  validates :nickname, presence: { message: "Veuillez saisir un pseudonyme" }
end
