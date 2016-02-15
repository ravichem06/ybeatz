class AddBannerToEvents < ActiveRecord::Migration
  
 def self.up
    add_column :events, :banner_file_name,    :string
    add_column :events, :banner_content_type, :string
    add_column :events, :banner_file_size,    :integer
    add_column :events, :banner_updated_at,   :datetime
    add_column :events, :tagline,   :string
    
    add_column :events, :doors_open,   :datetime
    add_column :events, :ticket_price,   :integer
  end
  
  def self.down
    remove_column :events, :banner_file_name
    remove_column :events, :banner_content_type
    remove_column :events, :banner_file_size
    remove_column :events, :banner_updated_at
    remove_column :events, :tagline,   :string
    remove_column :events, :description,   :string
    remove_column :events, :doors_open,   :datetime
    remove_column :events, :ticket_price,   :integer
  end
  
end
