# -*- encoding : utf-8 -*-
class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street
      t.integer :postal_code
      t.string :town

      t.timestamps
    end
  end
end
