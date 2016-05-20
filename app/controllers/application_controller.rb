class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :resource_name, :resource, :devise_mapping
  before_filter :update_sanitized_params, if: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

  protected

  

def store_location
  # store last url as long as it isn't a /users path
  session[:previous_url] = request.fullpath unless request.fullpath =~ /\/members/
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end
  

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:surname, :name, :email, :password, :password_confirmation, :current_password, :avatar)}
  end

def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:surname, :name, :email, :password, :password_confirmation, :avatar)}
end

  def resource_name
    :member
  end
 
  def resource
    @resource ||= Member.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:member]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
private

    
end
