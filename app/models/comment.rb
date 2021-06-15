class Comment < ApplicationRecord
  validates_presence_of :user_id, :artwork_id, :body
  belongs_to :user
  belongs_to :artwork
  # Like polymorphic association
  has_many :likes, :as => :likeable
  has_many :liking_viewers, through: :likes, source: :user
end
