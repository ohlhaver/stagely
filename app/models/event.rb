class Event < ActiveRecord::Base
	validates_presence_of :description, :venue_id, :time, :date
	validates_length_of :description, :maximum => 95
	
	belongs_to :venue
end
