if Rails.env.production?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        # Amazon S3 setting
        :provider              => 'AWS',
        :aws_access_key_id     => ENV['CLOUDCUBE_ACCESS_KEY_ID'],
        :aws_secret_access_key => ENV['CLOUDCUBE_SECRET_ACCESS_KEY'],
        :region                => ENV['CLOUDCUBE_REGION'],
        :host                  => ENV['CLOUDCUBE_HOST'],
        :endpoint              => ENV['CLOUDCUBE_URL'] 
      }
      
      config.fog_directory     =  ENV['CLOUDCUBE_BUCKET']
      config.fog_public        =  false

    end
  end