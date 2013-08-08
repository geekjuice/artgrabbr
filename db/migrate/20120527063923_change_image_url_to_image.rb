class ChangeImageUrlToImage < ActiveRecord::Migration
  def change
    rename_column :artwork_images, :image_url, :image
  end
end
