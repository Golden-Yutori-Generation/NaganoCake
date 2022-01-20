class Member::ItemsController < ApplicationController
  
  def top
    @items = Item.last(4)
  end

  def about
  end

  def index
    @items = Item.page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
  end
  
end
