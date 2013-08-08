class ChangeInfoInArtworkToText < ActiveRecord::Migration
  def change
  	change_column :artworks, :info, :text, :limit => nil
  end
end
