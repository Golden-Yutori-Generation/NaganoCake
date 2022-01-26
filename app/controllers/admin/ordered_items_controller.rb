class Admin::OrderedItemsController < ApplicationController
  def update
    ordered_item = OrderedItem.find(params[:id])
    @order = ordered_item.order
    ordered_item.update(ordered_item_params)
    if ordered_item.middle?
      @order.order_status = "item_middle"
      @order.save
    elsif ordered_item.comp?
      @order.order_status = "item_pre"
      @order.save
    end
    redirect_to admin_order_path(@order)
  end

  def ordered_item_params
    params.require(:ordered_item).permit(:making_status)
  end
end
