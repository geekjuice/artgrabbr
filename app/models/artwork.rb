class Artwork < ActiveRecord::Base
  attr_accessible :user_id, :medium, :price, :title, :info, :size

  belongs_to :user
  has_many :artwork_images
  accepts_nested_attributes_for :artwork_images, allow_destroy: true
  has_many :orders


  validates :user_id, presence: true
  validates :title, presence: true
  validates :price, presence: true, :numericality => { :greater_than => 0} # FIX: Check that it's not free $0.00

end
