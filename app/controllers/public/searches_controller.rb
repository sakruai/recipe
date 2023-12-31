class Public::SearchesController < ApplicationController
    before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @lists = List.looks(params[:search], params[:word])
    end
    render :search_result
  end
end
