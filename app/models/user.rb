class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :artworks, :foreign_key => 'artist_id', dependent: :destroy
  # Artworkshare many-to-many
  has_many :artwork_shares, :foreign_key => 'viewer_id', dependent: :destroy
  has_many :shared_artworks, through: :artwork_shares, class_name: 'Artwork'
  # Comment one-to-many
  has_many :comments, dependent: :destroy
  # Like - polymorphic associations
  has_many :likes
  has_many :liked_comments, through: :likes, source: :likeable, source_type: 'Comment'
  has_many :liked_artworks, through: :likes, source: :likeable, source_type: 'Artwork'
end
