# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

venues = Venue.create([
{ name: 'Philharmonie',  street: "Ernst Strasse 8", postal_code: "232324", town: "Mitte" }, 
{ name: 'Maltes Place',  street: "Wrangelstrasse 2", postal_code: "2321324", town: "Kreuzberg" },
{ name: 'Jamies Place',  street: "Metzer Strasse 12", postal_code: "232324", town: "Mitte" }, 
{ name: 'Localisto',  street: "Lychenerstr 14", postal_code: "112324", town: "Prenzlberg" }
])

events = Event.create([
{ description: 'Tanz in den Mai etwas verfrueht mit Frank Sinatra',  venue_id: "1", keywords: "tanz mai verfrueht frank sinatra", price: "5", date: "2012-03-20 00:00:00", time: "2012-03-13 20:15:00" },
{ description: 'Punjabi MC mit Band hier, Banghra India Dance',  venue_id: "2", keywords: "punjabi mc band banghra india dance", price: "6", date: "2012-03-20 00:00:00", time: "2012-03-13 20:15:00" },
{ description: 'Bach Mozart Violine von Ann-Sophie Mutter',  venue_id: "3", keywords: "bach mozart violine ann sophie mutter", price: "7", date: "2012-03-20 00:00:00", time: "2012-03-13 20:15:00" },
{ description: 'Bob Dylan live von seinem neuesten Album mit Band',  venue_id: "4", keywords: "bob dylan live album band", price: "8", date: "2012-03-20 00:00:00", time: "2012-03-13 20:15:00" },
{ description: 'Justus loves Puja and reads from his latest poems about this',  venue_id: "1", price: "8", date: "2012-03-20 00:00:00", time: "2012-03-13 20:15:00" } 
])
