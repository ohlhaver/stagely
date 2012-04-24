class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :topic_id, :genre_id
    rename_column :events, :type_id, :subgenre_id
  end
end
