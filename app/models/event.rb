class Event < ActiveRecord::Base

has_attached_file :banner, :styles => 
           { :medium => "300x300>", :thumb => "100x100>", :large => "1280x720", :headline => "1280x720"}

validates_attachment_content_type :banner, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
