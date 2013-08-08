class User < ActiveRecord::Base
  attr_accessible :bio, :email, :major, :name, :school, :first_name, :last_name,
                  :avatar, :remote_avatar_url, :avatar_cache,
                  :pickup_location, :longitude, :latitude

  has_many :artworks
  
  validates :first_name, presence: true, 
                   length: { maximum: 50 },
                   format: {with: /^[a-zA-Z\s]+$/,
                            message: "should only contains letters"}
  validates :last_name, presence: true, 
                   length: { maximum: 50 },
                   format: {with: /^[a-zA-Z\s]+$/,
                            message: "should only contains letters"}
  validates :pickup_location, presence: true
  # validates :school, presence: true,
  #                  format: {with: /^[a-zA-Z'\s]+$/,
  #                           message: "should only contains letters"}
  # validates :major, presence: true,
  #                  format: {with: /^[a-zA-Z'\s]+$/,
  #                           message: "should only contains letters"}
  # validates :bio, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: {with: VALID_EMAIL_REGEX}#,
                    # uniqueness: { case_sensitive: false }
  
  mount_uploader :avatar, AvatarUploader

  before_save :cleanup           

  geocoded_by :pickup_location
  after_validation :geocode, :if => :pickup_location_changed?       
  
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.pickup_location    = geo.address
    end
  end
  after_validation :reverse_geocode

  private 

  def cleanup
    self[:first_name] = self[:first_name].split(' ').map {|w| w.capitalize }.join(' ')
    self[:last_name]  = self[:last_name].split(' ').map {|w| w.capitalize }.join(' ')
    self[:name]       = "#{first_name} #{last_name}"
    self[:school]     = self[:school].split(' ').map {|w| w.capitalize }.join(' ')
    self[:major]      = self[:major].split(' ').map {|w| w.capitalize }.join(' ')
    self[:bio]        = self[:bio].capitalize.strip
  end

end
