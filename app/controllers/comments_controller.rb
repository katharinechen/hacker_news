class CommentsController < ApplicationController 

  before_filter :authorize, only: [:new, :create]

  def new
    @comment = Comment.new 
    @link = Link.find(params[:link_id])
    @vote = Vote.new
  end

  def create
    @comment = Comment.new(comment_params)
    @link = Link.find(params[:link_id])

    if @comment.save 
      flash[:notice] = "Your comment has been saved."
      redirect_to new_link_comment_path(@link)
    else
      flash[:alert] = "Your comment has not been saved. Try again."
      render "new"
    end
  end

private 
  
  def comment_params 
    params.require(:comment).permit(:user_id, :text, :commentable_id, :commentable_type)
  end 
end 