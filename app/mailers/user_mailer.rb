class UserMailer < ApplicationMailer
include Devise::Mailers::Helpers

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :unlock_instructions, opts)
  end

  def password_change(record, token, opts={})
    @token = token
    devise_mail(record, :password_change, opts)
  end

  def welcome_mail(member)

  	@member = member
  	@url = "http://www.ybeatz.com/members/sign_in"
  	mail(:to => member.email, :subject => "Welcome to Ybeatz")

  end

  def thank_you_mail(contact)

  	@contact = contact
  	@url = "http://www.ybeatz.com/"
  	mail(:to => @contact.email, :subject => "Thank you for contacting us.")

  end

  def contact_us_mail(contact)
    @contact = contact
    mail(:to => "support@ybeatz.com", :subject => @contact.subject  )
  end
end
