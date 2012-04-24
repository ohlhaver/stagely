class Artist < ActiveRecord::Base
	attr_accessible :name, :subgenre_id
	has_many :events
	belongs_to :subgenre
end
