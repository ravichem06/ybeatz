class AddSlugToCommunities < ActiveRecord::Migration
  def change
    add_column :communities, :slug, :string, limit: 191
    add_index :communities, :slug, unique: true
  end
end
