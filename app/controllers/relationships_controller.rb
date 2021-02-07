class RelationshipsController < ApplicationController
  def show_follow
    @users = User.find(params[:id]).following_user
  end

  def show_follower
   @users = User.find(params[:id]).follower_user
  end

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
end
