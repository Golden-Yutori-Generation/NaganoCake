class MembersController < ApplicationController
  def show
    @member = current_member
  end

  def out
  end

  def edit
    @member = current_member
  end
  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to "/members/mypage"
    else
      render edit
    end
  end

  def destroy
    @member = current_member
    @member.update(member_status: true)
    #強制的にログアウトさせる記述が必要
    reset_session
    redirect_to "/"
  end

  private
    def member_params
      params.require(:member).permit(:family_name, :first_name, :ruby_family_name, :ruby_first_name, :post_code, :address, :phone_number)
    end

end


