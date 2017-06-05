require 'carrierwave/orm/activerecord'


CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV['Access Key ID'],
      aws_secret_access_key: ENV['Secret Access Key'],
      region:                ENV['Region'],
  }
  config.fog_directory  = 'todoitems'
end
