class ChangeArtworkPriceType < ActiveRecord::Migration
  def change
  	change_column :artworks, :price, :integer, :default => 0
  end
end
