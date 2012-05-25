class User < ActiveRecord::Base
  attr_accessible :bio, :email, :first_name, :last_name, :major, :school, :avatar, :remote_avatar_url

  has_many :artworks
  

  validates :first_name, presence: true, 
                   length: { maximum: 50 }
  validates :last_name, presence: true, 
                   length: { maximum: 50 }
  validates :school, presence: true
  validates :major, presence: true
  validates :bio, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  
  mount_uploader :avatar, AvatarUploader

  before_save :cleanup                  

  def name
    "#{first_name} #{last_name}"
  end


  private 

  def cleanup
    self[:first_name] = self[:first_name].capitalize
    self[:last_name]  = self[:last_name].capitalize 
    self[:school]     = self[:school].titleize
    self[:major]      = self[:major].titleize
    self[:bio]        = self[:bio].capitalize
  end
end
