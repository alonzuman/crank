class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    redirect_to root_path
  end
  
  def destroy
    @post = Post.find(params[:id])
    @like = @post.likes.find {|x| x[:user_id] == current_user.id}
    @like.delete
    redirect_to root_path
  end

end