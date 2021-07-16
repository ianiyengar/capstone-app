class Album < ApplicationRecord
  belongs_to :artist
  has_many :artists, :through => :album_artists
end
