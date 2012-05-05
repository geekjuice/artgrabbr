class AdminController < ActionController::Base
  protect_from_forgery
  http_basic_authenticate_with :name => "artgrabbr", :password => "nicknick"
  layout "application"

end
