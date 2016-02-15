class UpdatedEvents < ActiveRecord::Migration
  
  	def change
    add_column("events", "country", :string, :limit => 25)
	rename_column("events", "place", "city")
	add_column("events", "state", :string, :limit => 25)
	add_column("events", "venue", :string, :limit => 25)
    end


end
