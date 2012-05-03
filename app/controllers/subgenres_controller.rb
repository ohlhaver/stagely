class SubgenresController < InheritedResources::Base
	before_filter :power_user, only: [:new, :create, :edit, :update, :destroy]
end
