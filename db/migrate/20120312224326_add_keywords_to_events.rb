# -*- encoding : utf-8 -*-
class AddKeywordsToEvents < ActiveRecord::Migration
  def up
    add_column :events, :keywords, :string
  end

  def down
    remove_column :events, :keywords
  end
end
