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
      @member.save
      redirect_to admin_members_path(member.id)
    end

end
