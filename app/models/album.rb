class Album < ApplicationRecord
  has_many :top_tens
  belongs_to :artist
end
