class TypesController < InheritedResources::Base
	before_filter :power_user
end
