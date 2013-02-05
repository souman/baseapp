class PostsController < ApplicationController

  def new
    @post = Post.new
    @topics = Topic.all
  end

  def create
    @post = Post.new(params[:post])
    @post.topic_id = params[:post]["topic"]
    @post.user = current_user
    @post.save!
    redirect_to :action => "index"
  end

  def index
    @posts = params[:topic_id].present? ? Topic.find(params[:topic_id]).posts : Post.all(:include => :topic)
  end

  def destroy
    post = Post.find(params[:id])
    return unless post.can_destroy?(current_user)
    post.destroy
    redirect_to :action => "index"
  end

  def show
    @post = Post.find(params[:id], :include => :comments)
    @comments = @post.comments
  end

end
