class Subgenre < ActiveRecord::Base
	attr_accessible :name, :genre_id
	has_many :events
	has_many :artists
	belongs_to :genre
end
