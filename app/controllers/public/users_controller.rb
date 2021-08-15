class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      @user.save
      redirect_to public_users_my_page_path(current_user)
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def unsubscribe_update
  end
  
  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
  
  end
end
