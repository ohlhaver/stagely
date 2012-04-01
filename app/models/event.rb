# -*- encoding : utf-8 -*-
class Event < ActiveRecord::Base
        attr_accessible :venue_id, :date, :time, :description, :price
	validates_presence_of :description, :venue_id, :time, :date
	validates_length_of :description, :maximum => 90
	
	belongs_to :venue
        belongs_to :user


	before_save :generate_keywords
        before_save :make_date_precise
        #before_save :remove_stagely_as_author

	define_index do
	    # fields
	    indexes description, :sortable => true
            indexes venue(:name), :as => :venue
            indexes venue.street, :as => :street
            indexes venue.town, :as => :town

	    # attributes
            has date, venue_id
	  
  	end

        def to_param
                "#{id}-#{self.description.gsub(/\W/, '-')}"
        end

  	private

        def make_date_precise
                date = (self.date.year.to_s + "-" + self.date.month.to_s + "-" + self.date.day.to_s + " " + self.time.to_s(:time))
                self.date = Time.zone.parse(date)
                #self.time = self.date
                
        end

  	def generate_keywords
            text= self.description

            text = text.gsub(/\W/, ' ')

            array = text.split(/\s+/)

            array = array.collect {|e| e.downcase if e != nil}

            position = array.inject(Hash.new(0)) {|h,x| h[x]+=1;h}
            position.delete_if {|key, value| key == nil}
            position.delete_if {|key, value| key.length < 4}


            keywords = (position.keys).join(' ')
                         
            keywords = ' ' + keywords + ' '

              if keywords != nil
                        
                #keywords=keywords.sub('—',' ')
                
                keywords=keywords.sub(' jan ',' ')
                keywords=keywords.sub(' feb ',' ')
                keywords=keywords.sub(' mar ',' ')
                keywords=keywords.sub(' apr ',' ')
                keywords=keywords.sub(' may ',' ')
                keywords=keywords.sub(' jun ',' ')
                keywords=keywords.sub(' jul ',' ')
                keywords=keywords.sub(' aug ',' ')
                keywords=keywords.sub(' sep ',' ')
                keywords=keywords.sub(' oct ',' ')
                keywords=keywords.sub(' nov ',' ')
                keywords=keywords.sub(' dec ',' ')
                
                keywords=keywords.sub(' monday ',' ')
                keywords=keywords.sub(' tuesday ',' ')
                keywords=keywords.sub(' wednesday ',' ')
                keywords=keywords.sub(' thursday ',' ')
                keywords=keywords.sub(' friday ',' ')
                keywords=keywords.sub(' saturday ',' ')
                keywords=keywords.sub(' sunday ',' ')
                   
                keywords=keywords.sub(' a ',' ')
                keywords=keywords.sub(' ap ',' ')
                keywords=keywords.sub(' about ',' ')
                keywords=keywords.sub(' an ',' ')
                keywords=keywords.sub(' am ',' ')
                keywords=keywords.sub(' and ',' ')
                keywords=keywords.sub(' are ',' ')
                keywords=keywords.sub(' at ',' ')
                keywords=keywords.sub(' as ',' ')
                keywords=keywords.sub(' be ',' ')
                keywords=keywords.sub(' but ',' ')
                keywords=keywords.sub(' by ',' ')
                keywords=keywords.sub(' can ',' ')
                keywords=keywords.sub(' do ',' ')
                keywords=keywords.sub(' does ',' ')
                keywords=keywords.sub(' for ',' ')
                keywords=keywords.sub(' from ',' ')
                keywords=keywords.sub(' got ',' ')
                keywords=keywords.sub(' has ',' ')
                keywords=keywords.sub(' have ',' ')
                keywords=keywords.sub(' he ',' ')
                keywords=keywords.sub(' her ',' ')
                keywords=keywords.sub(' him ',' ')
                keywords=keywords.sub(' if ',' ')
                keywords=keywords.sub(' ii ',' ')
                keywords=keywords.sub(' in ',' ')
                keywords=keywords.sub(' into ',' ')
                keywords=keywords.sub(' is ',' ')
                keywords=keywords.sub(' it ',' ')
                keywords=keywords.sub(' no ',' ')
                keywords=keywords.sub(' not ',' ')
                keywords=keywords.sub(' now ',' ')
                keywords=keywords.sub(' of ',' ')
                keywords=keywords.sub(' off ',' ')
                keywords=keywords.sub(' on ',' ')
                keywords=keywords.sub(' out ',' ')
                keywords=keywords.sub(' over ',' ')
                keywords=keywords.sub(' she ',' ')
                keywords=keywords.sub(' should ',' ')
                keywords=keywords.sub(' so ',' ')
                keywords=keywords.sub(' some ',' ')
                keywords=keywords.sub(' that ',' ')
                keywords=keywords.sub(' the ',' ')
                keywords=keywords.sub(' their ',' ')
                keywords=keywords.sub(' them ',' ')
                keywords=keywords.sub(' there ',' ')
                keywords=keywords.sub(' they ',' ')
                keywords=keywords.sub(' this ',' ')
                keywords=keywords.sub(' to ',' ')
                keywords=keywords.sub(' under ',' ')
                keywords=keywords.sub(' up ',' ')
                keywords=keywords.sub(' you ',' ')
                keywords=keywords.sub(' was ',' ')
                keywords=keywords.sub(' we ',' ')
                keywords=keywords.sub(' what ',' ')
                keywords=keywords.sub(' when ',' ')
                keywords=keywords.sub(' which ',' ')
                keywords=keywords.sub(' who ',' ')
                keywords=keywords.sub(' will ',' ')
                keywords=keywords.sub(' with ',' ')

                
                keywords=keywords.sub(' der ',' ')
                keywords=keywords.sub(' die ',' ')
                keywords=keywords.sub(' das ',' ')
                keywords=keywords.sub(' ein ',' ')
                keywords=keywords.sub(' eine ',' ')
                keywords=keywords.sub(' einer ',' ')
                keywords=keywords.sub(' sein ',' ')
                keywords=keywords.sub(' seine ',' ')
                keywords=keywords.sub(' ihr ',' ')
                keywords=keywords.sub(' ihre ',' ')
                keywords=keywords.sub(' auf ',' ')
                keywords=keywords.sub(' von ',' ')
                
                keywords=keywords.sub(' vom ',' ')
                keywords=keywords.sub(' zu ',' ')
                keywords=keywords.sub(' wegen ',' ')
                keywords=keywords.sub(' montag ',' ')
                keywords=keywords.sub(' dienstag ',' ')
                keywords=keywords.sub(' mittwoch ',' ')
                keywords=keywords.sub(' donnerstag ',' ')
                   
                keywords=keywords.sub(' freitag ',' ')
                keywords=keywords.sub(' samstag ',' ')
                keywords=keywords.sub(' sonntag ',' ')
                keywords=keywords.sub(' hat ',' ')
                keywords=keywords.sub(' haben ',' ')
                keywords=keywords.sub(' hatte ',' ')
                keywords=keywords.sub(' hatten ',' ')
                keywords=keywords.sub(' wie ',' ')
                keywords=keywords.sub(' wo ',' ')
                keywords=keywords.sub(' wann ',' ')
                keywords=keywords.sub(' wer ',' ')
                keywords=keywords.sub(' wen ',' ')
                keywords=keywords.sub(' wenn ',' ')
                keywords=keywords.sub(' den ',' ')
                keywords=keywords.sub(' dieses ',' ')
                keywords=keywords.sub(' heute ',' ')
                keywords=keywords.sub(' nicht ',' ')
                keywords=keywords.sub(' noch ',' ')
                keywords=keywords.sub(' als ',' ')
                keywords=keywords.sub(' zum ',' ')
                keywords=keywords.sub(' nach ',' ')
                keywords=keywords.sub(' vor ',' ')
                keywords=keywords.sub(' sie ',' ')
                keywords=keywords.sub(' sei ',' ')
                keywords=keywords.sub(' so ',' ')
                keywords=keywords.sub(' werde ',' ')
                keywords=keywords.sub(' ist ',' ')
                keywords=keywords.sub(' in ',' ')
                keywords=keywords.sub(' es ',' ')
                keywords=keywords.sub(' sich ',' ')
                keywords=keywords.sub(' ob ',' ')
                keywords=keywords.sub(' sind ',' ')
                keywords=keywords.sub(' solche ',' ')
                keywords=keywords.sub(' wurde ',' ')
                keywords=keywords.sub(' dass ',' ')
                keywords=keywords.sub(' am ',' ')
                keywords=keywords.sub(' und ',' ')
                keywords=keywords.sub(' oder ',' ')
                keywords=keywords.sub(' an ',' ')
                keywords=keywords.sub(' einige ',' ')
                keywords=keywords.sub(' dann ',' ')
                keywords=keywords.sub(' wird ',' ')
                keywords=keywords.sub(' werden ',' ')
                keywords=keywords.sub(' gab ',' ')
                keywords=keywords.sub(' denn ',' ')
                keywords=keywords.sub(' da ',' ')
                keywords=keywords.sub(' des ',' ')
                keywords=keywords.sub(' bei ',' ')
                keywords=keywords.sub(' durch ',' ')
                keywords=keywords.sub(' unter ',' ')
                keywords=keywords.sub(' etwas ',' ')
                keywords=keywords.sub(' etwa ',' ')
                #keywords=keywords.sub(' über ',' ')
                keywords=keywords.sub(' was ',' ')
                keywords=keywords.sub(' warum ',' ')
                keywords=keywords.sub(' welche ',' ')
                keywords=keywords.sub(' welches ',' ')
                keywords=keywords.sub(' im ',' ')
                keywords=keywords.sub(' innerhalb ',' ')
                keywords=keywords.sub(' mit ',' ')
             
              end
              self.keywords = keywords


        end

        def remove_stagely_as_author
               self.user_id = nil if self.user.uid == "568790501"
        end



        
end
