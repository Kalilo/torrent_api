class Torrent < ApplicationRecord
  validates_presence_of :url
end
