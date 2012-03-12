class Venue < ActiveRecord::Base
	validates_presence_of :name, :street, :postal_code
	has_many :events
end
