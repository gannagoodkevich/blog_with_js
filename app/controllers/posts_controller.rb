class PostsController < ApplicationController
  protect_from_forgery except: [:index]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end


  def show

  end

  def create
    @post = Post.create!(post_params)
    respond_to do |format|
      format.js
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
