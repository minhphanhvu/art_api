class CreateCreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, index: true, foreign_key: { to_table: :users }
      t.references :artwork, index: true, foreign_key: { to_table: :artworks }

      t.timestamps
    end
  end
end
