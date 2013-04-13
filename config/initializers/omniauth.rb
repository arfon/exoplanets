OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['IAU_TWITTER_KEY'], ENV['IAU_TWITTER_SECRET']
  provider :facebook, ENV['IAU_FACEBOOK_KEY'], ENV['IAU_FACEBOOK_SECRET']
end