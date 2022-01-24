class Admin::OrdersController < ApplicationController
  def top
    @ordered_items = OrderedItem.all
  end

  def show
    @ordered_item = OrderedItem.find(params[:id])
  end

  def update
  end
end
