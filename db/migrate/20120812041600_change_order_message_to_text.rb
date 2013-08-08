class ChangeOrderMessageToText < ActiveRecord::Migration
  	def up
    	change_column :orders, :inquirymessage, :text
	end
	def down
	    change_column :orders, :inquirymessage, :string
	end
end
