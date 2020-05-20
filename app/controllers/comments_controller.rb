class CommentsController < ApplicationController
  before_action :manage_comment, only: [:show, :destroy]

  def create
    #comments are created on the forum#show. Method to create comments on forum#show page
    @comment = Comment.new(comment_params)
    @comment.forum_id = params[:forum_id]
    @comment.user_id = current_user.id
    @comment.save
    redirect_to forum_path(params[:forum_id])
    
  end

  def show
  end

  def update
  end

  def destroy
    #after deleting comment redirected to forums#show page
    @comment.delete
    redirect_to "/forums/#{params[@forum_id]}"
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

  def manage_comment
    @comment = Comment.find(params[:comment_id])
  
  end 
end
