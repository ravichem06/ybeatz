class AddNameToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :name, :string
  end
end
