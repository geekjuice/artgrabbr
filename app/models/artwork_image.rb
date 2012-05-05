class ArtworkImage < ActiveRecord::Base
  belongs_to :artwork
  attr_accessible :description, :image_url
end
