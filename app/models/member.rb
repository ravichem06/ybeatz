class Member < ActiveRecord::Base
  
  extend FriendlyId
  friendly_id :first_name_and_surname, use: :slugged


  enum role: [:member, :editor, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_one :profile
  has_many :comments
  has_many :communities
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50>" }, :default_url => "avatar/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   def set_default_role
    self.role ||= :member
  end

  def first_name_and_surname
    "#{name}-#{surname}"
  end


end
