class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      
      t.string :event_name
      t.datetime :date
      t.string :place
      t.string :day_date
      t.string :description
      t.timestamps null: false
    end
  end
end
