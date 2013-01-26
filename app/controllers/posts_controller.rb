class PostsController < ApplicationController
  def index
    @posts = Post.limit(10)
  end

  def show
    @post = Post.find(params[:id])
  end
end
