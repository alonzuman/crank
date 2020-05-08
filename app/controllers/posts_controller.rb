class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(set_params)
    @post.user = current_user
    @post.save
    redirect_to post_path(@post)
  end

  def set_params
    params.require(:post).permit(:description)
  end
end
