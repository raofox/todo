Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
    info_fields:'name, email, gender, birthday', display: 'page'
    # :scope => 'birthday',
    # :info_fields => 'name, email, gender, birthday',
    # :display => 'popup',
end
