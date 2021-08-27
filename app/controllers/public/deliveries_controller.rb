class Public::DeliveriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.user_id = current_user.id
    if @delivery.save
      redirect_to public_deliveries_path, notice: "配送先を登録しました"
    else
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
    if @delivery.user_id == current_user
      redirect_to public_deliveries_path
    else
      render :edit
    end
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to public_deliveries_path, notice: "配送先が更新されました"
    else
      render :edit
    end
  end

  def destroy
    delivery = Delivery.find(params[:id])
    if delivery.destroy
      redirect_to public_deliveries_path, notice: "配送先が削除されました"
    else
      render :index
    end
  end

  def delivery_params
    params.require(:delivery).permit(:postal_code, :address, :name, :user_id)
  end
end
