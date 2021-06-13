class Artwork < ApplicationRecord
  validates_presence_of :title, :image_url, :artist_id
  belongs_to :user, :foreign_key => 'artist_id'
end
