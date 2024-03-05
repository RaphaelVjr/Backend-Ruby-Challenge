class User < ApplicationRecord
  validates :email, uniqueness: true
  has_secure_password
  has_many :user_movies
  has_many :movies, through: :user_movies
end
