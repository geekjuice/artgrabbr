class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :artwork_id,      :null => false
      t.string :name,             :null => false
      t.string :email,            :null => false
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.decimal :subtotal,        :precision => 8, :scale => 2, :default => 0.00
      t.decimal :total,           :precision => 8, :scale => 2, :default => 0.00
      t.string :delivery_method

      t.timestamps
    end
  end
end
