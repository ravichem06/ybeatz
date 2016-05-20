class Community < ActiveRecord::Base

has_attached_file :post_image, :styles => 
           { :medium => "720x640>", :thumb => "100x100>", :large => "720x640>", :headline => "1280x720"}

validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



end
