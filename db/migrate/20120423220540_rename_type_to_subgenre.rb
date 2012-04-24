class RenameTypeToSubgenre < ActiveRecord::Migration
  def self.up
    rename_table :types, :subgenres
  end

 def self.down
    rename_table :subgenres, :types
 end
end
