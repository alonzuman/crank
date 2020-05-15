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
    @post.save ? (redirect_to post_path(@post)) : (render :new) ;
  end

  def like
    @post = Post.find(params[:id])
    @post.likes.create(user_id: current_user.id)
    redirect_to post_path(@post)
  end
  
  def unlike
    @post = Post.find(params[:id])
    @like = @post.likes.find {|x| x[:user_id] == current_user.id}
    @like.delete
    redirect_to post_path(@post)
  end

  def save
    @saved_post = Save.new
    @post = Post.find(params[:id])
    @saved_post.post = @post
    @saved_post.user = current_user
    @saved_post.save
    redirect_to post_path(@post)
  end

  def unsave
    @save = Save.where(post_id: params[:id], user_id: current_user.id)
    @save.destroy_all
    redirect_to my_saved_posts_path
  end

  private

  def set_params
    params.require(:post).permit(:description, :video, category_list: []) #TODO add the video as well
  end
end
