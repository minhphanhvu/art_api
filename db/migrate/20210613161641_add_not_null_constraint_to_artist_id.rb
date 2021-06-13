class AddNotNullConstraintToArtistId < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:artworks, :artist_id, false)
  end
end
