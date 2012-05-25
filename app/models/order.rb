class Order < ActiveRecord::Base
  attr_accessible 	:address_line_1, :address_line_2, :city, :delivery_method, 
  					:email, :name, :state, :subtotal, :total, :zipcode, :artwork_id

  belongs_to :artwork

  validates :artwork_id, presence: true
  validates :name, presence: true
  validates :email, presence: true
end 
