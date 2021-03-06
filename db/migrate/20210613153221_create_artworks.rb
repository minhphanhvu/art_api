class CreateArtworks < ActiveRecord::Migration[6.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.references :artist, index: true, foreign_key: { to_table: :users } 

      t.timestamps
    end
  end
end
