class Movie < ApplicationRecord
  validates_presence_of :title

  has_many :torrents, through: :torrents_movies
  has_many :torrents_movies, dependent: :destroy
end
