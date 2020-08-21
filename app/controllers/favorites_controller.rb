class FavoritesController < ApplicationController
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.like(current_user)
    respond_to do |format|
      format.html { redirect_to 'microposts/index' }
      format.js
    end
    @micropost.create_notification_like!(current_user)
  end
  
  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    @micropost.unlike(current_user)
    respond_to do |format|
      format.html { redirect_to 'microposts/index' }
      format.js
    end
  end
  
end
