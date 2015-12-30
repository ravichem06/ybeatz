class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
    #redirect_to(:controller => :Users, :action => :create)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  
end
