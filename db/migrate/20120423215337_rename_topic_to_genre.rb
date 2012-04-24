class RenameTopicToGenre < ActiveRecord::Migration
  def self.up
    rename_table :topics, :genres
  end

 def self.down
    rename_table :genres, :topics
 end
end
