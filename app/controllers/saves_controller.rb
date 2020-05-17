class SavesController < ApplicationController
  def index
    @saves = Save.where(user: current_user)
  end

  def create
    @saved_post = Save.new
    @post = Post.find(params[:id])
    @saved_post.post = @post
    @saved_post.user = current_user
    @saved_post.save
    redirect_to post_path(@post)
  end

  def destroy
    @save = Save.where(post_id: params[:id], user_id: current_user.id)
    @save.destroy_all
    redirect_to my_saved_posts_path
  end

  private

  def set_params
    params.require(:save).permit(:post)
  end
end
