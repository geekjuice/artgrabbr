class Artwork < ActiveRecord::Base
  belongs_to :user
  attr_accessible :medium, :price, :title
end
