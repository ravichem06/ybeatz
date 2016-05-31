class Topic < ActiveRecord::Base

	extend FriendlyId
	friendly_id :name, :use => [:slugged, :history]
	
  belongs_to :member
  has_many :posts

  def should_generate_new_friendly_id?
  	name_changed?
	end
end
