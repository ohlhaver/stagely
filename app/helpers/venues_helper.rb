# -*- encoding : utf-8 -*-
module VenuesHelper
	def vtweet_text(venue)
		"#{venue.name} @ #{venue.street} (#{venue.town})"
	end
end
