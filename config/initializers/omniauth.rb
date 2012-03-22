if Rails.env.production?
   	
   	Rails.application.config.middleware.use OmniAuth::Builder do
  		provider :facebook, '367315919957325','1eb6002c20b12b3004261fb36dd5db0e', {:scope => ""}
	end

elsif Rails.env.development?
   	
   	Rails.application.config.middleware.use OmniAuth::Builder do
  		provider :facebook, '330051837042287','c12a7d79dbe85e2582cea2fee6c51256', {:scope => ""}
  	end
else  
	Rails.application.config.middleware.use OmniAuth::Builder do
  		provider :facebook, '367315919957325','1eb6002c20b12b3004261fb36dd5db0e', {:scope => ""}
  	end
end
