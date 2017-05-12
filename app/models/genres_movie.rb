class GenresMovie < ApplicationRecord
  belongs_to :genre
  belongs_to :movie

  validates_presence_of :genre
  validates_presence_of :movie
end
