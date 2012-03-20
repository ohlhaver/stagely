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

 	def get_breadcrumb_time(time_breadcrumb)
 		return nil if time_breadcrumb =="Today"
 		return "tomorrow" if time_breadcrumb =="Tomorrow"
 		return "week" if time_breadcrumb =="This week"
 		return "month" if time_breadcrumb =="This month"
 	end



end
