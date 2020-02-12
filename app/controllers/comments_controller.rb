class CommentsController < ApplicationController
  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def index
    @post = Post.find_by(id: params[:post_id])
    @comments = @post.comments
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.create!(comment_params)
    @post.comments << @comment
    respond_to do |format|
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
