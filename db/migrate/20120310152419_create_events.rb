class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :date
      t.integer :venue_id
      t.string :price

      t.timestamps
    end
  end
end
