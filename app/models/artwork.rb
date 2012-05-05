class Artwork < ActiveRecord::Base
  
  belongs_to :user
  has_many :artwork_images
  has_one :order

  attr_accessible :medium, :price, :title
  
end
