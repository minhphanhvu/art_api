class ArtworkShare < ApplicationRecord
  validates_presence_of :viewer_id, :artwork_id
  belongs_to :viewer, :foreign_key => 'viewer_id', :class_name => 'User'
  belongs_to :shared_artwork, :foreign_key => 'artwork_id', :class_name => 'Artwork'
end