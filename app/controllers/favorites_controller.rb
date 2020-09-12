class FavoritesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    # ここにmicropostをお気に入りに入れたときの処理を書く
    #binding.pry
    micropost = Micropost.find(params[:micropost_id])
    current_user.addfavorite(micropost)
    flash[:success] = '投稿をフォローしました。'
    redirect_to user_path(micropost.user_id)          #参照しているuserのmicropost一覧に画面を留める
    
  end

  def destroy
    # ここにmicropostをお気に入りから外したときの処理を書く
    favorites = Favorite.find(params[:id])
    current_user.removefavorite(favorites)
    flash[:success] = '投稿を解除しました。'
    _user = Micropost.find(favorites.micropost_id)    #micropostモデルから投稿userを検索
    redirect_to user_path(_user.user_id)              #検索したuserのmicropost一覧に画面を留める
  end




end
