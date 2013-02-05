class TopicsController < ApplicationController

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params[:topic])
    @topic.user = current_user
    @topic.save!
    redirect_to :action => "index"
  end

  def index
    @topics = Topic.all
  end

  def destroy
    topic = Topic.find(params[:id])
    redirect_to :action => "index" and return unless topic.can_destroy?(current_user)
    topic.destroy
    redirect_to :action => "index"
  end

end
