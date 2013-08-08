class AdminController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => ENV['BASIC_NAME'], :password => ENV['BASIC_PASSWORD']
  layout "application"
end
