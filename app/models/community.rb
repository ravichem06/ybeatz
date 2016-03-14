class Community < ActiveRecord::Base

has_attached_file :post_image, :styles => 
           { :medium => "300x300>", :thumb => "100x100>", :large => "1280x720", :headline => "1280x720"}

validates_attachment_content_type :post_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]



end
