require "development_mail_interceptor"

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address => ENV['SMTP_ADDRESS'],
  :port      => 587,
  :user_name => ENV['SMTP_USERNAME'],
  :password => ENV['SMTP_PASSWORD'],
  :authentication => :plain
}

if Rails.env.development?
  ActionMailer::Base.default_url_options[:host] = "localhost"
  ActionMailer::Base.smtp_settings[:domain] = "localhost:3000"
  ActionMailer::Base.smtp_settings[:port] = "3000"
  ActionMailer::Base.default_url_options[:port] = 3000
elsif Rails.env.staging?
  ActionMailer::Base.default_url_options[:host] = "artgrabbr-staging.herokuapp.com"
  ActionMailer::Base.smtp_settings[:domain] = "artgrabbr-staging.herokuapp.com"
elsif Rails.env.production?
  ActionMailer::Base.default_url_options[:host] = "www.artgrabbr.com"
  ActionMailer::Base.smtp_settings[:domain] = "www.artgrabbr.com"
end
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if (Rails.env.development?)
