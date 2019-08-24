require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.ignore_integrity_errors = true
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.enable_processing = Rails.env.test? ? false : true
end

if ENV["DOCUMENTS_STORAGE_SYSTEM"] == "FILE"
  CarrierWave.configure do |config|
    config.storage = :file
    config.asset_host = ActionController::Base.asset_host
  end
elsif ENV["DOCUMENTS_STORAGE_SYSTEM"] == "S3"
  CarrierWave.configure do |config|
    config.fog_provider = "fog/aws"                             # required
    config.fog_credentials = {
      provider:              "AWS",                             # required
      aws_access_key_id:     ENV["S3__AWS_ACCESS_KEY_ID"],      # required
      aws_secret_access_key: ENV["S3__AWS_SECRET_ACCESS_KEY"],  # required
      region:                ENV["S3__AWS_REGION"].presence || "us-east-1",
      # host:                  "s3.example.com",                # optional, defaults to nil
      # endpoint:              "https://s3.example.com:8080"    # optional, defaults to nil
    }
    config.fog_directory  = ENV["S3__BUCKET_NAME"].presence || ENV["APP_NAME"]
    config.fog_public     = true # optional, defaults to true
    config.fog_attributes = {
      cache_control: "public, max-age=#{365.day.to_i}"
    } # optional, defaults to {}
    config.cache_dir = "#{Rails.root}/tmp/uploads" # To make it work on Heroku ( https://github.com/carrierwaveuploader/carrierwave/wiki/How-to%3A-Make-Carrierwave-work-on-Heroku )
    # config.s3_access_policy = :public_read  # Generate http:// urls. Defaults to :authenticated_read (https://)
    config.storage = :fog
  end
else
  raise ArgumentError.new("ENV['DOCUMENTS_STORAGE_SYSTEM'] must be set to `FILE` or `S3`")
end

# hacky hack!
module CarrierWave
  module Storage
    class Fog
      class File
        def basename
          filename_elements = filename.split('.')
          filename_elements.first if filename_elements.size > 1
        end
      end
    end
  end
end