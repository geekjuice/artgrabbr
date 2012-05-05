class Order < ActiveRecord::Base
  attr_accessible :address_line_1, :address_line_2, :city, :delivary_method, :email, :name, :state, :subtotal, :total, :zipcode

  belongs_to :artwork
end
