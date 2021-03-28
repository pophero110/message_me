class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true, length: { in: 3..15 }
  has_secure_password
  has_many :messages
end
