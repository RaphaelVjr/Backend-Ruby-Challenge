class Movie < ApplicationRecord
  has_many :user_movies
  has_many :users, through: :user_movies
  validates :title, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Film.create! row.to_hash
    end
  end

  def self.submit(file)
    CSV.foreach(file.path, headers: true) do |row|
      Rating.create! row.to_hash
    end
  end
end
