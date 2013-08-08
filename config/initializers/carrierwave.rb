# For Development - Local Storage
if Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
  end
end

if Rails.env.staging?
  CarrierWave.configure do |config|
    config.storage = :fog
  end
end

# For Production - Amazon S3 via Fog
if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
  end
end
