class UsersController < ApplicationController

	layout 'users'

	def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'New user created.'
      redirect_to(:action => 'index')
    else
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = 'User #{@user.first_name} updated.'
      redirect_to(:action => 'index')
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to(:action => 'index')
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
      :email, :username, :password, :date_of_birth, :gender, :number)
  end

end
