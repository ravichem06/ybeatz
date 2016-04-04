
class LandingPageController < ApplicationController

layout 'landing_page'

def index
	
@subscriber = Subscriber.new

end




def create
    # Instantiate a new object using form parameters
    
    @subscriber = Subscriber.new(subscriber_params)
    
    # Save the object
       if @subscriber.save(subscriber_params)
           # puts "Subscriber has been saved."
          #@subscriber.subscribe
        
    
 

          # If save succeeds, redirect to the index action
          flash[:notice] = "Thank You for subscribing. Your Email ID: #{@subscriber.email} has been subscribed."
          
          redirect_to(:action => 'index')
        else
          # If save fails, redisplay the form so user can fix problems
      
      flash[:error] = "Please enter a valid Email Address."
      redirect_to(:action => 'index')
    end
  end



  
  
  

  private

    def subscriber_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subscriber).permit(:name, :email)
    end

end
