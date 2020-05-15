class PostsController < ApplicationController
  def index
    @users_i_follow = current_user.following_ids
    @posts = Post.where(user: @users_i_follow)
  end

  def discover
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(set_params)
    @post.user = current_user
    @post.save ? (redirect_to post_path(@post)) : (render :new);
  end

  private

  def set_params
    params.require(:post).permit(:description, :video, category_list: [])
  end
end
