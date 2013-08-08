class ArtworkImage < ActiveRecord::Base
  attr_accessible :artwork_id, :description, :showcaseimage, :image, :remote_image_url, :image_cache

  belongs_to :artwork

  validates :image, presence: true
  # validates :description, presence: true

  mount_uploader :image, ArtworkimageUploader
  
end
