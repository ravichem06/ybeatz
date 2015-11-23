class ContactsController < ApplicationController
layout false
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
      redirect_to(:controller=> 'landing_page',:action => 'index')
    else
      flash.now[:error] = 'Cannot send message.'
      render layout: "landing_page", file: "landing_page/index"
    end
  end
end
