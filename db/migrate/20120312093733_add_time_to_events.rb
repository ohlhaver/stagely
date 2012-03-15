# -*- encoding : utf-8 -*-
class AddTimeToEvents < ActiveRecord::Migration
  def up
    add_column :events, :time, :time
  end

  def down
    remove_column :events, :time
  end
end
