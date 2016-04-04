class Community < ActiveRecord::Base



  
  validates :title, :length => { :minimum => 5 }

has_attached_file :post_image, :styles => 
           { :medium => "300x300>", :thumb => "100x100>", :large => "1280x720", :headline => "1280x720"}

validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

belongs_to :member 
has_many :comments
scope :newest_first, lambda { order("communities.created_at DESC")}
scope :without_community, lambda{|community| community ? {:conditions => ["community.id != ?", @community.id]} : {} }

end
