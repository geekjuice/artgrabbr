class User < ActiveRecord::Base
  attr_accessible :bio, :email, :first_name, :last_name, :major, :school

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
end
