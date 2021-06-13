class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :artworks, :foreign_key => 'artist_id', dependent: :destroy
end
