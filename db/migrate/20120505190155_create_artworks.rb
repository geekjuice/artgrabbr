class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.references :user
      t.string :title
      t.decimal :price,       :precision => 8, :scale => 2, :default => 0.0
      t.string :medium
      t.string :info
      t.timestamps
    end
    add_index :artworks, :user_id
  end
end
