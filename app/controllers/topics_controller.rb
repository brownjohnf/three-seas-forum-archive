class TopicsController < ApplicationController
  def index
    @topics = Topic.paginate(:page => params[:page])
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(:page => params[:page])
  end
end
