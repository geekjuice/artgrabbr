class AddShowcaseImageToArtworkImages < ActiveRecord::Migration
  def change
    add_column :artwork_images, :showcaseimage, :boolean
  end
end
