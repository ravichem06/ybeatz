class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  
  layout 'common'

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.new(post_params)
    @post.save
    redirect_to topic_path(@topic)    
      
    
  end

  
  
  private
   
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:subject, :body, :topic_id, :member_id)
    end

    
end
