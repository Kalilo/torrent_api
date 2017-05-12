class TorrentsMovie < ApplicationRecord
  belongs_to :torrent
  belongs_to :movie

  validates_presence_of :torrent
  validates_presence_of :movie
end
