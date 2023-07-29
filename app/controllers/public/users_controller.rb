class Public::UsersController < ApplicationController
  before_action :set_user, only: [:favorites, :show, :edit, :update]
  def show
    @lists = @user.lists
  end

  def edit
  end
  
  def update
    @user.update(user_params)
    flash[:notice] = "successfully."
    redirect_to user_path(@user.id)
 
  end
  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:list_id)
    @lists = List.find(favorites)
  end

   def check
    @user = current_user
   end

  def withdraw
    @user  = current_user
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
