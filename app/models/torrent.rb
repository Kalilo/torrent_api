class Torrent < ApplicationRecord
  validates_presence_of :url

  has_many :torrents_movies, dependent: :destroy
  has_many :movies, through: :torrents_movies
end
