class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zipcode
      t.decimal :subtotal,       :precision => 8, :scale => 2, :default => 0.0
      t.decimal :total,          :precision => 8, :scale => 2, :default => 0.0
      t.string :delivary_method

      t.timestamps
    end
  end
end
