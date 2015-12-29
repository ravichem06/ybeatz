class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please sign in."
      redirect_to(:controller => 'landing_page', :action => 'index')
      return false # halts the before_action
    else
      return true
    end
  end
end
