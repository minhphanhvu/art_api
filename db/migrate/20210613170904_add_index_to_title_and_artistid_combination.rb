class AddIndexToTitleAndArtistidCombination < ActiveRecord::Migration[6.1]
  def change
    add_index :artworks, [:title, :artist_id]
  end
end
