class AddPasswordRestToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :password_reset_token, :string
    add_column :buyers, :password_reset_sent_at, :datetime
  end
end
