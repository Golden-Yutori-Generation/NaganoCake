class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def top
    @ordered_items = OrderedItem.all
    @total_price = 0
  end

  def show
    @ordered_item = OrderedItem.find(params[:id])
    @total_price = 0
  end

  def update
  end
end
