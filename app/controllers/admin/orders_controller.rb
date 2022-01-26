class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
    @ordered_items = @order.ordered_items
    @order.update(order_params)
    if @order.money_confirm?
     @ordered_items.each do |ordered_item|
      ordered_item.making_status = "wait"
      ordered_item.save
      # ordered_item.update(making_status: "wait")
     end
    end
    redirect_to admin_order_path(@order)
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end
