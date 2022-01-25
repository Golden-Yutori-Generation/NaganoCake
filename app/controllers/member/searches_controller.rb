class Member::SearchesController < ApplicationController
  def search
    @items = Item.where(name: params[:search]).page(params[:page]).per(8)
    @genres = Genre.all
    render "member/items/index"
  end
end
