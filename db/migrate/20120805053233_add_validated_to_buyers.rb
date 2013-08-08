class AddValidatedToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :validated, :boolean, :default => false
  end
end
