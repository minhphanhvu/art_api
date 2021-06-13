class CreateArtworkSharesTable < ActiveRecord::Migration[6.1]
  def change
    create_table :artwork_shares do |t|
      t.references :artwork, index: true, foreign_key: { to_table: :artworks }
      t.references :viewer, index: true, foreign_key: { to_table: :users }  
      t.timestamps
    end
  end
end
