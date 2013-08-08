class AddOrderStatusToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :status, :string
    remove_column :orders, :subtotal 
  end
end
