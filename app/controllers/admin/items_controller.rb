class Admin::ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_path
  end
  
  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(item)
  end
  
end
