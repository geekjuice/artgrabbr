class AddMessageToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :inquirymessage, :string
  end
end
