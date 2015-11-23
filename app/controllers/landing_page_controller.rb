class LandingPageController < ApplicationController

layout 'landing_page'

def index
	

end

def create
    # Instantiate a new object using form parameters
    
    @subscriber = Subscriber.new(subscriber_params)
    
    # Save the object
    if @subscriber.save
      
      # If save succeeds, redirect to the index action
      flash[:notice] = "Thank You for subscribing. Your Email ID has been entered successfully into our database."
      
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      
      render('index')
    end
  end



  
  
  

  private

    def subscriber_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subscriber).permit(:email)
    end

end
