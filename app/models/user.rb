class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with:/\A\S+@\S+\.\S+\z/ }
  validates :password, length: { in: 8..32 }, format: { with:/\A[a-zA-Z0-9]+\z/ }

  has_secure_password
end
