class Artwork < ActiveRecord::Base
  attr_accessible :medium, :price, :title

  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :price, presence: true # FIX: Check that it's not free $0.00
  

  has_many :artwork_images
  has_one :order

end
