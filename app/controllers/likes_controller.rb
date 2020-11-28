class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(infolist_id: params[:infolist_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(infolist_id: params[:infolist_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
