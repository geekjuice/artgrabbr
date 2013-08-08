class AddRememberTokenToBuyers < ActiveRecord::Migration
  def change
  	add_column :buyers, :remember_token, :string
    add_index  :buyers, :remember_token
  end
end
