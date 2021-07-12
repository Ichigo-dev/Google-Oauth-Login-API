OmniAuth.config.allowed_request_methods = %i[get]
Rails.application.config.middleware.use OmniAuth::Builder do
   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], name: :google, scope: %w(email)
end
