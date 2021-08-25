class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @relationship = current_user.following.find_by(id: @user.id);
  end
end
