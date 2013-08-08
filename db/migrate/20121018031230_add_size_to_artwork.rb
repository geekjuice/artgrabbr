class AddSizeToArtwork < ActiveRecord::Migration
  def change
    add_column :artworks, :size, :string
  end
end
