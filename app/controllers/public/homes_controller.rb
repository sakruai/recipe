class Public::HomesController < ApplicationController
  def top
    @lists = List.all
  end

  def about
  end
end
