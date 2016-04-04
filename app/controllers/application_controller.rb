class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :update_sanitized_params, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:surname, :name, :email, :password, :password_confirmation, :current_password, :avatar)}
  end

def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:surname, :name, :email, :password, :password_confirmation, :avatar)}
end





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
