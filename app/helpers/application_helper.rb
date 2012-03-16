# -*- encoding : utf-8 -*-
module ApplicationHelper

	def full_title(page_title)
	    base_title = "stage.ly"
	    if page_title.empty?
	      base_title
	    else
	      "#{page_title} | #{base_title}"
	    end
 	end

	  def twitter_url(tweet_url, tweet_text)
		tweet_url = shoort_url(request.url)
		"http://twitter.com/home?status=#{tweet_text} #{tweet_url}"
	  end

end
