class Artwork < ActiveRecord::Base
  attr_accessible :user_id, :medium, :price, :title, :info

  belongs_to :user
  has_many :artwork_images
  has_one :order


  validates :user_id, presence: true
  validates :title, presence: true
  validates :price, presence: true # FIX: Check that it's not free $0.00

end
