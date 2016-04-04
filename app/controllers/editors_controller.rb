class EditorsController < ApplicationController
before_action :authenticate_member!
before_action :editor_only


layout	'common'

  def index

  	@posts = current_member.communities.paginate(page: params[:page], per_page: 6)

  end






  private

  def editor_only
    unless current_member.editor?
      redirect_to "/", :alert => "Access denied."
    end
  end



end
