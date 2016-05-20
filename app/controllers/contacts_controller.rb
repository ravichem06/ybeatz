class ContactsController < ApplicationController
layout 'common'
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_us_params)
    # @contact.save
    @contact.request = request
    if @contact.deliver
      
      flash[:notice] = "Thank you for your message. We will contact you soon!"
      redirect_to(:controller=> 'landing_page',:action => 'index')
    else
      flash.now[:error] = 'Cannot send message.'
      render layout: "landing_page", file: "landing_page/index"
    end
  end

  def contact_us_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:contact).permit(:email, :name, :message)
    end
end
