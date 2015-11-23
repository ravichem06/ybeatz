class SubscribersController < ApplicationController



layout false


  def create
    # Instantiate a new object using form parameters
    
    @subscriber = Subscriber.new(subscriber_params)
    
    # Save the object
    if @subscriber.save
      
      # If save succeeds, redirect to the index action
      flash[:notice] = "Your ID was entered successfully."
      
      redirect_to(:action => 'thank_you')
    else
      # If save fails, redisplay the form so user can fix problems
      
      render(:controller=>'landing_page', :action=>'index')
    end
  end

  

  def thank_you

  end

  private

    def subscriber_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subscriber).permit(:email)
    end

end
