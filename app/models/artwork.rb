class Artwork < ApplicationRecord
  validates_presence_of :title, :image_url, :artist_id
  belongs_to :user, :foreign_key => 'artist_id'
  # ArtworkShare many-to-many relationship
  validates :title, uniqueness: { scope: :artist_id,
    message: 'Each artist must have unique titles(titles can be the same for different artists)' }
  has_many :artwork_shares, :foreign_key => 'artwork_id'
  has_many :shared_viewers, through: :artwork_shares, :foreign_key => 'artwork_id', :class_name => 'User'
end
