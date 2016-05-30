class CommentsController < ApplicationController

# def index
# @comment = Comment.all
# end


def create
        @community = Community.friendly.find(params[:community_id])
        @comment = @community.comments.new(comment_params)
        

    if member_signed_in?
	    @comment.member = current_member
	    
	end
    @comment.save
    redirect_to community_path(@community.slug)
    
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :content, :member_id, :email, :community_id)
    end

end
