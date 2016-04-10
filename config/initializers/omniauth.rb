Rails.application.config.middleware.use OmniAuth::Builder do

  GOOGLE_CONFIG = YAML.load_file("#{::Rails.root}/config/google.yml")[::Rails.env]

  if Rails.env.development?
    OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
  end

  provider :google_oauth2, GOOGLE_CONFIG['client_id'], GOOGLE_CONFIG['secret'],
  {
    # access_type: 'offline',
    scope: 'userinfo.email, userinfo.profile',
    # prompt: 'select_account consent',
    # callback_path: '/auth/google/callback',
    callback_uri: 'http://localhost:3000/auth/google/callback'
    # approval_prompt: 'force'
  }
end
