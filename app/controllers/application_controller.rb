# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_topics(events)
    all_keywords =""
      events.each do |e|
        (all_keywords = all_keywords + e.keywords) 
      end

      all_keywords_array = all_keywords.split(/\s+/)
      keywords_with_values = all_keywords_array.inject(Hash.new(0)) {|h,x| h[x]+=1;h}
      ranked_array = keywords_with_values.sort_by { |key, value| -value }
      words =[]
      ranked_array.first(5).each do |f|
        words = words.push(f[0])
      end
      @words=words
  end


end
