class Public::TagsearchesController < ApplicationController
   def search
    @model = List  #search機能とは関係なし
    @word = params[:content]
    @lists = List.where("category LIKE?","%#{@word}%")
    render "public/tagsearches/tagsearch"
  end
end
