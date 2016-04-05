class MembersController < ApplicationController
  before_action :authenticate_member!, :except => :show
  before_action :admin_only, :except => :show

  layout 'member'

  def index
    @members = Member.paginate(page: params[:page], per_page: 10)
  end

  def show

    @member = Member.friendly.find(params[:id])
    @posts = @member.communities.paginate(page: params[:page], per_page: 6)
    
  end


  def update
    @member = Member.friendly.find(params[:id])
    if @member.update_attributes(secure_params)
      redirect_to members_path, :notice => "Member role changed to #{@member.role.capitalize}."
    else
      redirect_to members_path, :alert => "Unable to update member."
    end
  end

  def destroy
    member = Member.friendly.find(params[:id])
    member.destroy
    redirect_to members_path, :notice => "Member deleted."
  end

  private

  def admin_only
    unless current_member.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  def secure_params
    params.require(:member).permit(:role, :sign_up, :name, :surname, :avatar)
  end

end
