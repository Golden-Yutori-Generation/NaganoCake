class Member::ItemsController < ApplicationController

  def top
    @items = Item.last(4)
    @genres = Genre.all
  end

  def about
  end

  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

end
