class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!

    def index
      @members = Member.page(params[:page]).order(:id)
    end

    def show
      @member = Member.find(params[:id])
    end

    def edit
      @member = Member.find(params[:id])
    end

    def update
      @member = Member.find(params[:id])
      @member.update(member_params)
      redirect_to admin_member_path(@member)
    end

    private
    def member_params
      params.require(:member).permit(:family_name, :first_name, :ruby_family_name, :ruby_first_name, :post_code, :address, :phone_number, :member_status)
    end
end
