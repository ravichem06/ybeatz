class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.column "first_name", :string, :limit => 25, :null => false
      t.string "last_name", :limit => 50, :null => false
      t.string "email", :default => "", :null => false
      t.float "number" , :limit => 10 , :null => false
      t.string "password", :limit => 40
      t.time "date_of_birth", :null => false
      t.boolean "gender" , :null => false
      t.timestamps null: false
    end
  end
end
