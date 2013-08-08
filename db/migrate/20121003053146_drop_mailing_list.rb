class DropMailingList < ActiveRecord::Migration
  def up
  	drop_table :mailinglists
  end

  def down
  	create_table :mailinglists
  end
end
