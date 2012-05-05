class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.references :user
      t.string :title
      t.decimal :price
      t.string :medium

      t.timestamps
    end
    add_index :artworks, :user_id
  end
end
