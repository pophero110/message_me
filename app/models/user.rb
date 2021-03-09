class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { minmun: 3, maximum: 15 }
  has_secure_password
  has_many :messages
end
