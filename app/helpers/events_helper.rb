# -*- encoding : utf-8 -*-
module EventsHelper

	def complete_address(e)
		return e.venue.name + " - " + e.venue.street
	end

	def add_new_venue
		return link_to 'add new venue', new_venue_path
	end

	def submit_price
		return link_to_function "enter price", "$('#price_input, .icon').toggle('price_input')"
	end


end
