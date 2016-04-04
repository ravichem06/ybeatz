class AddMemberIdToCommunities < ActiveRecord::Migration
  def change

  	add_column :communities, :member_id, :integer

  	add_index("communities", "member_id")
  end
end
