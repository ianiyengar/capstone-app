class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :top_tens
  has_many :albums, through: :top_tens
end
