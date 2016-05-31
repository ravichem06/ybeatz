class AddSlugToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :slug, :string, limit: 191
    add_index :topics, :slug, unique: true
  end
end
