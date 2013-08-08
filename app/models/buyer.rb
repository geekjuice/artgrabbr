class Buyer < ActiveRecord::Base
  attr_accessible 	:email, :name, :first_name, :last_name, :inquirycount, 
  					:password, :password_confirmation, :validated, :validation_code,
            :password_reset_token, :password_reset_sent_at

  has_secure_password

  has_many :orders
  before_create :cleanup, :create_remember_token, :create_validation_code

  validates :first_name, presence: true, 
                   length: { maximum: 50 },
                   format: {with: /^[a-zA-Z\s]+$/,
                            message: "should only contains letters"}
  validates :last_name, presence: true, 
                   length: { maximum: 50 },
                   format: {with: /^[a-zA-Z\s]+$/,
                            message: "should only contains letters"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }, :on => :create
  validates :password_confirmation, presence: true, :on => :create

def send_password_reset
  create_reset_token
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

  private
  
    def cleanup
      self[:first_name]   = self[:first_name].capitalize.strip
      self[:last_name]    = self[:last_name].capitalize.strip
      self[:name]         = "#{first_name} #{last_name}"
      self[:inquirycount] = 0 
    end

    def create_reset_token
      self[:password_reset_token] = SecureRandom.urlsafe_base64
    end

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def create_validation_code
      self[:validation_code] = SecureRandom.urlsafe_base64
    end
end
