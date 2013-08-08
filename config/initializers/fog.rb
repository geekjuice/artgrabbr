CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_PUBLIC_KEY'],
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],
  }
  if Rails.env.production?
  	config.fog_directory  = ENV['AWS_BUCKET_PRODUCTION']
  elsif Rails.env.staging?
  	config.fog_directory  = ENV['AWS_BUCKET_STAGING']
  end
  config.fog_public     = true
end
