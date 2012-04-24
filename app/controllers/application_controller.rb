# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_topics_old(events)
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

    def find_topics(events)
    all_keywords =""
      events.each do |e|
        (all_keywords = all_keywords + " " + e.subgenre.name) unless e.subgenre == nil
      end

      all_keywords_array = all_keywords.split(/\s+/)
      keywords_with_values = all_keywords_array.inject(Hash.new(0)) {|h,x| h[x]+=1;h}
      ranked_array = keywords_with_values.sort_by { |key, value| -value }
      words =[]
      ranked_array.first(5).each do |f|

        words = words.push(f) unless f[0]==""
      end
      @words=words
  end

private

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user

def authorize
  if current_user.nil?
    store_location
    redirect_to "/auth/facebook" 
  end
end

def store_location
  session[:return_to] = request.fullpath
end

  def power_user
    #@venue =Venue.find(params[:id])
    redirect_to root_url if current_user.uid != "568790501"
  end

end
