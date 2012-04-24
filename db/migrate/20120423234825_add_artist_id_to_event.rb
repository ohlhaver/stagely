class AddArtistIdToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :artist_id, :integer
  end
end
