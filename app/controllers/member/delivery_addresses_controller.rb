class Member::DeliveryAddressesController < ApplicationController
  before_action :authenticate_member!

    def index
      @delivery_addresses = DeliveryAddress.where(member_id: current_member)
      @delivery_address = DeliveryAddress.new
    end

    def create
      @delivery_address = DeliveryAddress.new(delivery_address_params)
      @delivery_address.member_id = current_member.id
      @delivery_address.save
        redirect_to delivery_addresses_path
    end

  	def edit
      @delivery_address = DeliveryAddress.find(params[:id])
  	end

  	def update
  	  @delivery_address = DeliveryAddress.find(params[:id])
  	  @delivery_address.update(delivery_address_params)
       redirect_to delivery_addresses_path
  	end

  	def destroy
  	  @delivery_address = DeliveryAddress.find(params[:id])
  	  @delivery_address.destroy
      @delivery_addresses = current_member.delivery_address.id
        # redirect_to delivery_addresses_path
  	end

  	private

    def delivery_address_params
      params.require(:delivery_address).permit(:member_id, :post_code, :address, :name)
    end

end
