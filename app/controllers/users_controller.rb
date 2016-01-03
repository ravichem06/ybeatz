class UsersController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"]).new(user_params)
		if user.save!
			redirect_to root_path
		else
			render("index")
		end
	end 	

private
def user_params
	params.require(:users).permit( :provider,  :uid , :name, :oauth_token)

end

end