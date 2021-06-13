class Artwork < ApplicationRecord
  validates_presence_of :title, :image_url, :artist_id
  validates :title, uniqueness: { scope: :artist_id,
    message: 'Each artist must have unique titles(titles can be the same for different artists)' }
  belongs_to :user, :foreign_key => 'artist_id'
end
