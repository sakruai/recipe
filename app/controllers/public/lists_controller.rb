class Public::ListsController < ApplicationController
  def new
    @list = List.new
  end
  
    # 投稿データの保存
  def create
    @list = List.new(list_params)
    @list.user_id = current_user.id
    @list.save
    redirect_to lists_path
  end
  
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def destroy
    list = List.find(params[:id])  # データ（レコード）を1件取得
    list.destroy  # データ（レコード）を削除
    redirect_to lists_path  # 投稿一覧画面へリダイレクト 
    flash[:notice] = "successfully" 
  end
   # 投稿データのストロングパラメータ
  private

  def list_params
    params.require(:list).permit(:name, :image, :price, :explanation)
  end
end
