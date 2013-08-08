class AddValidationCodeToBuyers < ActiveRecord::Migration
  def change
    add_column :buyers, :validation_code, :string
  end
end
