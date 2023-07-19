class User < ApplicationRecord
  validates :nickname, presence: true, length: { maximum: 50 }

end
