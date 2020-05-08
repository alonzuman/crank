class UsersController < ApplicationController
  def dashboard
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    @follow = Follow.create(follower_id: current_user.id, followed_user_id: params[:id])
    @follow.save
    redirect_to users_path(params[:id])
  end

  def unfollow
    @follow_to_remove = Follow.where(follower_id: current_user.id, followed_user_id: params[:id])
    @follow_to_remove.destroy_all
    redirect_to users_path(params[:id])
  end
end