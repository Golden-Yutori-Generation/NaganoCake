class Member::CartItemsController < ApplicationController
  def index
    # @cart_items = CartItem.where(member_id: current_member)
    @cart_items = current_member.cart_items
    @total_price = 0
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    cart_item = CartItem.find_by(member_id: current_member.id, item_id: params[:cart_item][:item_id])
    #cart_item = CartItem.find_by(member_id: current_member.id, item_id: cart_item_params[:item_id])
    if cart_item
      new_amount = cart_item.amount.to_i + cart_item_params[:amount].to_i
      cart_item.update(amount: new_amount)
    else
      # @cart_item.member_id = current_member.id
      # @cart_item.item_id = params[:cart_item][:item_id]
      @cart_item.save
    end

    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_member.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :member_id, :amount)
  end
end
