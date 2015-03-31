Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV['client_id'], ENV['client_secret'], :scope => 'r_fullprofile r_emailaddress', :fields => ['id', 'email-address', 'first-name', 'last-name', 'location', 'industry', 'picture-url', 'public-profile-url']
end