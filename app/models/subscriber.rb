class Subscriber < ActiveRecord::Base
  # include ActiveModel::Model
  # include ActiveModel::Validations
  #attr_accessor :email, :string
  # validates_presence_of :email
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  # Excon.defaults[:ssl_verify_peer] = false
  # def subscribe
  #   # mailchimp = Mailchimp::API.new("0c4d8cacc2ccb7ef2a13fa624d538a3c-us12")
  #   @list_id = "b369342c9f"
  #   mailchimp = Gibbon::Request.new(api_key: '0c4d8cacc2ccb7ef2a13fa624d538a3c-us12')
    
  #   mailchimp.lists.subscribe({
  #     :id => @list_id,
  #     :email => {:email =>self.email},
  #     :double_optin => false,
  #     :update_existing => true,
  #     :send_welcome => true
  #   })
    
  # end
     
    
    
	
end