class AddPriceRequestToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :requested_price, :integer
  end
end
