class SubgenresController < InheritedResources::Base
	before_filter :power_user
end
