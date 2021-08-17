class TopController < ApplicationController
  def top
  end

  def user
    @users = User.all
  end
end
