Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, '12345-key', '12345-secret'
  provider :facebook, '419683531454139', '7184bc6e5de7ac1483b41ed8f71d444d'
end
