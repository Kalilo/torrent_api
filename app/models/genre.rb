class Genre < ApplicationRecord
  validates_presence_of :name

  has_many :genres_movies, dependent: :destroy
  has_many :movies, through: :genres_movies
end
