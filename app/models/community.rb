class Community < ActiveRecord::Base

extend FriendlyId
friendly_id :title, :use => [:slugged, :history]



  
  validates :title, :length => { :minimum => 5 }

has_attached_file :post_image, :styles => 
           { :medium => "300x200#", :thumb => "37x37#", :large => "720x480#"}

validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

belongs_to :member 
has_many :comments
scope :newest_first, lambda { order("communities.created_at DESC")}
scope :without_community, lambda{|community| community ? {:conditions => ["community.id != ?", @community.id]} : {} }
# scope :prev_post, lambda{ :conditions => ["@community.created_at < ?", @community.created_at], :order => "communities.created_at DESC" }
# scope :next_post, lambda{:conditions => ["@community.created_at > ?", @community.created_at], :order => "communities.created_at ASC"}


def previous_post
  Community.where(["id < ?", id]).order('id asc').last
end

def next_post
  Community.where(["id > ?", id]).order('id asc').first
end
# def to_param

# 	"#{id}-#{title.parameterize}"

# end

end
