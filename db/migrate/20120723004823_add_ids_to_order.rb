class AddIdsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :buyer_id, :integer
    drop_table :inquiries
  end
end
