class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(set_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end 
  end

  private

  def set_params
    params.require(:post).permit(:description) #TODO add the video as well
  end
end
