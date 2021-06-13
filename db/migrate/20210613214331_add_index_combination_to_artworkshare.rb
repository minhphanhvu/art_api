class AddIndexCombinationToArtworkshare < ActiveRecord::Migration[6.1]
  def change
    add_index :artwork_shares, [:viewer_id, :artwork_id]
  end
end
