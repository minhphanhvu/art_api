class Comment < ApplicationRecord
  validates_presence_of :user_id, :artwork_id, :body
  belongs_to :user
  belongs_to :artwork
end
