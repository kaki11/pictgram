class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, uniqueness: true, format: { with:/\A\S+@\S+\.\S+\z/ }
  validates :password, confirmation: true, length: { in: 8..32 }, format: { with:/(?=.*?[a-zA-Z])(?=.*?\d)[\w]/ }

  has_secure_password
  has_many :topics
  has_many :favorites
  has_many :comments
  has_many :favorite_topics, through: :favorites, source: 'topic'
end
