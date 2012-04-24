class Subgenre < ActiveRecord::Base
	attr_accessible :name, :genre_id
	has_many :events
	belongs_to :genre
end
