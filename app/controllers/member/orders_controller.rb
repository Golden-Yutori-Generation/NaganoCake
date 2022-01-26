class Member::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.order_status = 0
    if @order.save
      current_member.cart_items.each do | cart_item |
        ordered_item = OrderedItem.new
        ordered_item.order_id = @order.id
        ordered_item.item_id = cart_item.item_id
        ordered_item.perchace_price = cart_item.item.no_tax_price
        ordered_item.amount = cart_item.amount
        ordered_item.making_status = 0
        ordered_item.save
      end
      current_member.cart_items.destroy_all
      redirect_to  orders_complete_path
    else
      render :new
    end
  end

  def confirm
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    @total_price = 0
    @cart_items = current_member.cart_items
    @order.order_status = 0
    if params[:order][:address_option] == 0.to_s
      @order.shipping_post_code = current_member.post_code
      @order.shipping_address = current_member.address
      @order.shipping_name = current_member.full_name
    elsif params[:order][:address_option] == 1.to_s
      @delivery_addresses = DeliveryAddress.find(params[:order][:delivery_address_id])
      @order.shipping_post_code = @delivery_addresses.post_code
      @order.shipping_address = @delivery_addresses.address
      @order.shipping_name = @delivery_addresses.name
    else
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    end
  end

  def complete
  end

  def index
    @orders = current_member.order
  end

  def show
    @order = Order.find(params[:id])
    @total_price = 0
  end

  private
  def order_params
    params.require(:order).permit(:order_status, :payment_method, :shipping_post_code, :shipping_address, :shipping_name, :billing_amount, :member_id)
  end

end
