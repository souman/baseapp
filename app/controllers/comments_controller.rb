class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.post_id = params[:comment]["post_id"]
    @comment.user = current_user
    @comment.save!
    redirect_to :back
  end

  def destroy
    comment = Comment.find(params[:id])
    redirect_to :back and return unless comment.can_destroy?(current_user)
    comment.destroy
    redirect_to :back
  end

end
