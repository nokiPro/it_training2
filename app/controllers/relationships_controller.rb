class RelationshipsController < ApplicationController

  def create
    relationship = current_user.active_relationships.create(followed_id: params[:user_id])
    redirect_to users_show_url(id: params[:user_id]), notice: "#さんをフォローしました"
  end

  def destroy
    relationship = current_user.active_relationships.find_by(followed_id: params[:user_id]).destroy
    redirect_to users_show_url(id: params[:user_id]), notice: "さんのブログをお気に入り解除しました"
  end
end
