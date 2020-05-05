class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
    @user = User.find(params[:id])
    @follow = Follow.create(follower_id: current_user.id, followed_user_id: params[:id])
    raise
  end

  def unfollow
  end
end


# // app/views/restaurants/destroy.js.erb
# document.querySelector("[data-restaurant-id='<%= @restaurant.id %>']")
#   .remove();