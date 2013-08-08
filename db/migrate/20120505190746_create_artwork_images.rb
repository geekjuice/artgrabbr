class CreateArtworkImages < ActiveRecord::Migration
  def change
    create_table :artwork_images do |t|
      t.references :artwork
      t.string :description
      t.string :image_url

      t.timestamps
    end
    add_index :artwork_images, :artwork_id
  end
end
