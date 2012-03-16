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

	def shoort_url(url)
	    short_url = Shortener::ShortenedUrl.generate(url)
	    short_url ? url_for(:controller => :"shortener/shortened_urls", :action => :show, :id => short_url.unique_key, :only_path => false) : url
	end

	def tweet_text(event)
		"#{event.description} - #{event.date.to_date.to_s(:short)} - #{event.time.to_s(:time)} - #{event.venue.town} -"
	end

end
