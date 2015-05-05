Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_key'], ENV['twitter_secret'],
                      {
                        :secure_image_url => 'true',
                        :image_size => 'original'
                      }
  provider :facebook, ENV['facebook_id'], ENV['facebook_secret'],
                      :secure_image_url => 'true', :image_size => 'large', :display => 'popup'
end
