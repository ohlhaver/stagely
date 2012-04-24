class GenresController < InheritedResources::Base
	before_filter :power_user
end
