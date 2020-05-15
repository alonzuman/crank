class SavesController < ApplicationController
  def index
    @saves = Save.where(user: current_user)
  end
end
