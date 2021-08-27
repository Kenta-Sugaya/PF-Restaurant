class Admin::ShopsController < ApplicationController
  def index
    @shop = Shop.all
    @shops = Shop.page(params[:page]).per(9)
  end

  def new
    @shop = Shop.new
  end

  def create
    shop = Shop.new(shop_params)
    shop.save
    redirect_to admin_shop_path(shop)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to admin_shop_path
  end

  private

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_image, :shop_introduction)
  end
end
