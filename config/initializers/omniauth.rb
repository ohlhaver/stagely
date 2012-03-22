Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '367315919957325','1eb6002c20b12b3004261fb36dd5db0e', {:scope => ""}

end