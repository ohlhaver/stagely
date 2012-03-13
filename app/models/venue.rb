class Venue < ActiveRecord::Base
	validates_presence_of :name, :street, :postal_code
	validates_length_of :town, :maximum => 10
	has_many :events
end
