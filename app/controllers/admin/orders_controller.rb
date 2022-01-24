class Admin::OrdersController < ApplicationController
  def top
    @ordered_items = OrderedItem.all
  end

  def show
  end
  
  def update
  end
end
