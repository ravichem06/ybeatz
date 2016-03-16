class AddNameToMembers < ActiveRecord::Migration
  def change
    add_column :members, :name, :string
    add_column :members, :surname, :string
  end
end
