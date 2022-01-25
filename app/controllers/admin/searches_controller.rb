class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!
  def search
    @member = Member.where(family_name: params[:search])
    render "member/items/index"
  end
end