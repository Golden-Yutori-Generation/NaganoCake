class Member::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to orders_confirm_path
    else
      render :new
    end
  end

  def confirm
    @order = Order.new
    @cart_items = current_member.cart_items
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
      @order.shipping_post_code = params[:order][:shippong_post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    end
  end

  def complete
  end

  def index
    @ordered_items = OrderedItem.all
  end

  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :shipping_post_code, :shipping_address, :shipping_name)
  end

end
