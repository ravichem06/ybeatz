class AdminController < ApplicationController
before_action :authenticate_member!
before_action :admin_only


layout	'common'

  def index

  	@posts = current_member.communities.paginate(page: params[:page], per_page: 6)

  end






  private

  def admin_only
    unless current_member.admin?
      redirect_to "/", :alert => "Access denied."
    end
  end


end
