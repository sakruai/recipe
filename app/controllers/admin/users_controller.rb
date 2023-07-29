class Admin::UsersController < ApplicationController
   before_action :authenticate_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update(user_params)
     flash[:notice] = "You have updated customer successfully."
     redirect_to admin_user_path(@user.id)  
    else
      render :edit
    end
  end


protected
 
  def user_params
    params.require(:user).permit(:name,  :email, :is_active)
  end
end

