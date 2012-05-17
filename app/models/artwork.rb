class Artwork < ActiveRecord::Base
  attr_accessible :medium, :price, :title

  belongs_to :user

  validates :user_id, presence: true

  has_many :artwork_images
  has_one :order

end
