class AddGenreIdToSubgenre < ActiveRecord::Migration
  def change
    add_column :subgenres, :genre_id, :integer

  end
end
