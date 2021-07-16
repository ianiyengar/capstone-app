class Artist < ApplicationRecord
  has_many :albums
  has_many :albums, :through => :album_artists
end
