class RegistrationsController < Devise::RegistrationsController
  
  def create
    super
    UserMailer.welcome_mail(resource).deliver unless resource.invalid?
  end

  protected

  def after_sign_up_path_for(resource)
    new_profile_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_profile_path
  end
  
end
