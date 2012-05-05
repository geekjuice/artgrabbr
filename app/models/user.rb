class User < ActiveRecord::Base
  attr_accessible :bio, :email, :first_name, :last_name, :major, :school

  has_many :artworks
  
end