class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:success] = "登録情報を変更しました"
      redirect_to admin_user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :unsubscribe_status)
  end
end
