# -*- encoding : utf-8 -*-
class Venue < ActiveRecord::Base
	attr_accessible :name, :street, :postal_code
	validates_presence_of :name, :street, :postal_code
	validates_length_of :town, :maximum => 9
	validates_length_of :postal_code, :maximum => 5


	has_many :events
	belongs_to :user
	before_save :generate_town_ny


	 def to_param
                "#{id}-#{self.name.gsub(/\W/, '-')}"
     end

     def generate_town_ny
	    postal_code = self.postal_code.to_i

	    borough ="Manhattan" if postal_code > 10000 && postal_code < 10300
	    borough ="St.Island" if postal_code > 10300 && postal_code < 10315
	    borough ="Bronx" if postal_code > 10450 && postal_code < 10500
	    borough ="Queens" if postal_code > 11000 && postal_code < 11200
	    borough ="Brooklyn" if postal_code > 11200 && postal_code < 11300
	    borough ="Queens" if postal_code > 11350 && postal_code < 12000

       	self.town = borough unless borough == nil
	end

	def generate_town_berlin
	    postal_code = self.postal_code

	    h = {
        12487 => "Adlershof",
        12489 => "Adlershof",
        12524 => "Altglienicke",
        12435 => "Alt-Treptow",
        12437 => "Baumschulenweg",
        12683 => "Biesdorf",
        13129 => "Blankenburg",
        13159 => "Blankenfelde",
        12526 => "Bohnsdorf",
        13509 => "Borsigwalde",
        12099 => "Britz",
        12347 => "Britz",
		12349 => "Britz",
		12351 => "Britz",
		12359 => "Britz",
		13125 => "Buch",
		13127 => "Buchholz",
		12107 => "Buckow",
		12305 => "Buckow",
		12349 => "Buckow",
		12351 => "Buckow",
		12353 => "Buckow",
		12357 => "Buckow",
		12359 => "Buckow",
		10585 => "Charlottenburg",
		10587 => "Charlottenburg",
		10589 => "Charlottenburg",
		10623 => "Charlottenburg",
		10625 => "Charlottenburg",
		10627 => "Charlottenburg",
		10629 => "Charlottenburg",
		10707 => "Charlottenburg",
		10709 => "Charlottenburg",
		10711 => "Charlottenburg",
		10719 => "Charlottenburg",
		10787 => "Charlottenburg",
		10789 => "Charlottenburg",
		13353 => "Charlottenburg",
		13597 => "Charlottenburg",
		13627 => "Charlottenburg",
		13629 => "Charlottenburg",
		14050 => "Charlottenburg",
		14052 => "Charlottenburg",
		14053 => "Charlottenburg",
		14055 => "Charlottenburg",
		14057 => "Charlottenburg",
		14059 => "Charlottenburg",
		14169 => "Dahlem",
		14193 => "Dahlem",
		14195 => "Dahlem",
		13057 => "Falkenberg",
		12527 => "Schönefeld",
		13127 => "Buchholz",
		13158 => "Buchholz",   
		10827 => "Friedenau",
		12157 => "Friedenau",
		12159 => "Friedenau",
		12161 => "Friedenau",
		12163 => "Friedenau",
		14197 => "Friedenau",

		10315 => "Friedrichsfelde",
		10317 => "Friedrichsfelde",
		10318 => "Friedrichsfelde",
		10319 => "Friedrichsfelde",

		12587 => "Friedrichshagen",

		10243 => "Friedrichshain",
		10245 => "Friedrichshain",
		10247 => "Friedrichshain",
		10249 => "Friedrichshain",

		13465 => "Frohnau",

		14089 => "Gatow",
		12527 => "Grünau",
		10711 => "Grunewald",
		14055 => "Grunewald",
		14193 => "Grunewald",
		14199 => "Grunewald",
		13587 => "Hakenfelde",
		13599 => "Haselhorst",
		13503 => "Heiligensee",
		13505 => "Heiligensee",
		13089 => "Heinersdorf",
		12619 => "Hellersdorf",
		12621 => "Hellersdorf",
		12627 => "Hellersdorf",
		12629 => "Hellersdorf",
		13465 => "Hermsdorf",
		13467 => "Hermsdorf",
		12589 => "Hessenwinkel",
		13051 => "Hohenschönhausen",
		13053 => "Hohenschönhausen",
		13055 => "Hohenschönhausen",
		13057 => "Hohenschönhausen",
		13059 => "Hohenschönhausen",
		12487 => "Johannisthal",
		12489 => "Johannisthal",
		10318 => "Karlshorst",
		12527 => "Karolinenhof",
		13125 => "Karow",
		12619 => "Kaulsdorf",
		12621 => "Kaulsdorf",
		12623 => "Kaulsdorf",
		13505 => "Konradshöhe",
		12555 => "Köpenick",
		12557 => "Köpenick",
		12559 => "Köpenick",
		10785 => "Kreuzberg",
		10961 => "Kreuzberg",
		10963 => "Kreuzberg",
		10965 => "Kreuzberg",
		10967 => "Kreuzberg",
		10969 => "Kreuzberg",
		10997 => "Kreuzberg",
		10999 => "Kreuzberg",
		12247 => "Lankwitz",
		12249 => "Lankwitz",
		10317 => "Lichtenberg",
		10365 => "Lichtenberg",
		10367 => "Lichtenberg",
		10369 => "Lichtenberg",
		12107 => "Lichtenrade",
		12305 => "Lichtenrade",
		12307 => "Lichtenrade",
		12309 => "Lichtenrade",
		12203 => "Lichterfelde",
		12205 => "Lichterfelde",
		12207 => "Lichterfelde",
		12209 => "Lichterfelde",
		12279 => "Lichterfelde",
		14167 => "Lichterfelde",
		14169 => "Lichterfelde",
		14195 => "Lichterfelde",
		13469 => "Lübars",
		12623 => "Mahlsdorf",
		13051 => "Malchow",
		13051 => "Margaretenhöhe",
		12099 => "Mariendorf",
		12103 => "Mariendorf",
		12105 => "Mariendorf",
		12107 => "Mariendorf",
		12109 => "Mariendorf",
		12277 => "Mariendorf",
		12107 => "Marienfelde",
		12277 => "Marienfelde",
		12279 => "Marienfelde",
		12307 => "Marienfelde",
		12679 => "Marzahn",
		12681 => "Marzahn",
		12685 => "Marzahn",
		12687 => "Marzahn",
		12689 => "Marzahn",
		10115 => "Mitte",
		10117 => "Mitte",
		10119 => "Mitte",
		10178 => "Mitte",
		10179 => "Mitte",
		10435 => "Mitte",
		12559 => "Müggelheim",
		10965 => "Neukölln",
		10967 => "Neukölln",
		12043 => "Neukölln",
		12045 => "Neukölln",
		12047 => "Neukölln",
		12049 => "Neukölln",
		12051 => "Neukölln",
		12053 => "Neukölln",
		12055 => "Neukölln",
		12057 => "Neukölln",
		12059 => "Neukölln",
		12099 => "Neukölln",
		12435 => "Neukölln",
		12439 => "Niederschöneweide",
		13156 => "Niederschöneweide",
		13158 => "Niederschöneweide",
		14109 => "Nikolassee",
		14129 => "Nikolassee",
		14163 => "Nikolassee",
		14193 => "Nikolassee",
		12459 => "Oberschöneweide",
		10439 => "Pankow",
		13187 => "Pankow",
		13189 => "Pankow",
		13595 => "Pichelsdorf",
		13597 => "Pichelsdorf",
		12435 => "Plänterwald",
		12437 => "Plänterwald",
		10247 => "Prenzlauer Berg",
		10249 => "Prenzlauer Berg",
		10405 => "Prenzlauer Berg",
		10407 => "Prenzlauer Berg",
		10409 => "Prenzlauer Berg",
		10435 => "Prenzlauer Berg",
		10437 => "Prenzlauer Berg",
		10439 => "Prenzlauer Berg",
		12589 => "Rahnsdorf",
		13403 => "Reinickendorf",
		13405 => "Reinickendorf",
		13407 => "Reinickendorf",
		13409 => "Reinickendorf",
		13437 => "Reinickendorf",
		13469 => "Reinickendorf",
		13509 => "Reinickendorf",
		13156 => "Rosenthal",
		13158 => "Rosenthal",
		12351 => "Rudow",
		12353 => "Rudow",
		12355 => "Rudow",
		12357 => "Rudow",
		12359 => "Rudow",
		10317 => "Rummelsburg",
		14193 => "Schmargendorf",
		14195 => "Schmargendorf",
		14199 => "Schmargendorf",
		12527 => "Schmöckwitz",
		10777 => "Schöneberg",
		10779 => "Schöneberg",
		10781 => "Schöneberg",
		10783 => "Schöneberg",
		10785 => "Schöneberg",
		10787 => "Schöneberg",
		10789 => "Schöneberg",
		10823 => "Schöneberg",
		10825 => "Schöneberg",
		10827 => "Schöneberg",
		10829 => "Schöneberg",
		10965 => "Schöneberg",
		12103 => "Schöneberg",
		12105 => "Schöneberg",
		12157 => "Schöneberg",
		12159 => "Schöneberg",
		13599 => "Siemensstadt",
		13627 => "Siemensstadt",
		13629 => "Siemensstadt",
		13581 => "Spandau",
		13583 => "Spandau",
		13585 => "Spandau",
		13587 => "Spandau",
		13589 => "Spandau",
		13591 => "Spandau",
		13593 => "Spandau",
		13595 => "Spandau",
		13597 => "Spandau",
		13599 => "Spandau",
		13581 => "Staaken",
		13591 => "Staaken",
		13593 => "Staaken",
		13088 => "Malchow",
		12157 => "Steglitz",
		12161 => "Steglitz",
		12163 => "Steglitz",
		12165 => "Steglitz",
		12167 => "Steglitz",
		12169 => "Steglitz",
		12247 => "Steglitz",
		14195 => "Steglitz",
		13403 => "Tegel",
		13405 => "Tegel",
		13503 => "Tegel",
		13505 => "Tegel",
		13507 => "Tegel",
		13509 => "Tegel",
		13599 => "Tegel",
		13629 => "Tegel",
		10965 => "Tempelhof",
		12099 => "Tempelhof",
		12101 => "Tempelhof",
		12103 => "Tempelhof",
		12105 => "Tempelhof",
		12107 => "Tempelhof",
		12109 => "Tempelhof",
		10551 => "Tiergarten",
		10553 => "Tiergarten",
		10555 => "Tiergarten",
		10557 => "Tiergarten",
		10559 => "Tiergarten",
		10785 => "Tiergarten",
		10787 => "Tiergarten",
		10963 => "Tiergarten",
		13353 => "Tiergarten",
		13469 => "Waidmannslust",
		14109 => "Wannsee",
		13051 => "Wartenberg",
		13059 => "Wartenberg",
		13347 => "Wedding",
		13349 => "Wedding",
		13351 => "Wedding",
		13353 => "Wedding",
		13355 => "Wedding",
		13357 => "Wedding",
		13359 => "Wedding",
		13405 => "Wedding",
		13407 => "Wedding",
		13409 => "Wedding",
		13086 => "Weißensee",
		13088 => "Weißensee",
		12589 => "Wilhelmshagen",
		10707 => "Wilmersdorf",
		10709 => "Wilmersdorf",
		10711 => "Wilmersdorf",
		10713 => "Wilmersdorf",
		10715 => "Wilmersdorf",
		10717 => "Wilmersdorf",
		10719 => "Wilmersdorf",
		10777 => "Wilmersdorf",
		10779 => "Wilmersdorf",
		10789 => "Wilmersdorf",
		10825 => "Wilmersdorf",
		14055 => "Wilmersdorf",
		14195 => "Wilmersdorf",
		14197 => "Wilmersdorf",
		14199 => "Wilmersdorf",
		13403 => "Wittenau",
		13407 => "Wittenau",
		13435 => "Wittenau",
		13437 => "Wittenau",
		13439 => "Wittenau",
		13469 => "Wittenau",
		13509 => "Wittenau",
		14129 => "Zehlendorf",
		14163 => "Zehlendorf",
		14165 => "Zehlendorf",
		14167 => "Zehlendorf",
		14169 => "Zehlendorf"                   
                }

                self.town = h[postal_code] unless h[postal_code] == nil
	end
end
