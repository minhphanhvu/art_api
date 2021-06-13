class ArtworkShare < ApplicationRecord
  validates_presence_of :viewer_id, :artwork_id
  validates :viewer_id, uniqueness: { scope: :artwork_id,
    message: 'A art cannot be shared more than one time with the same viewer' }
  belongs_to :shared_viewer, :foreign_key => 'viewer_id', :class_name => 'User'
  belongs_to :shared_artwork, :foreign_key => 'artwork_id', :class_name => 'Artwork'
end