class ArtworkImage < ActiveRecord::Base
  attr_accessible :artwork_id, :description, :image, :remote_image_url

  belongs_to :artwork

 	mount_uploader :image, ArtworkimageUploader
end
