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
  end

  def unfollow
    @unfollow = @user.followers.where(id: current_user.id)
    @unfollow.destroy
    # TODO
  end
end