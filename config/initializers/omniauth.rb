OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1627308574197447", "8c15f764908adb6c746791f56cc8bbf8", {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end