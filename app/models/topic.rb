class Topic < ActiveRecord::Base
  belongs_to :member
  has_many :posts
end
