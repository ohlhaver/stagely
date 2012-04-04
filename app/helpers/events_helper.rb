# -*- encoding : utf-8 -*-
module EventsHelper

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
		"#{event.who}: #{event.description}, #{event.date.strftime("%b%d")}, #{event.time.strftime("%I:%M%p")}, #{event.venue.town},"
	end

	def author(event)
			return link_to event.user.name, "https://www.facebook.com/#{event.user.uid}"
	end

	def who_character_count
		render :partial => 'who_counter'
	end

	def description_character_count
		render :partial => 'description_counter'
	end


end
