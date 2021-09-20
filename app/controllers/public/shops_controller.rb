class Public::ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @shops = Shop.all.order("id ASC")
    @products = Product.all.order("id ASC")
  end

  def show
    @shop = Shop.find(params[:id])
    @product = Product.find(params[:id])
  end

  def shop_params
    params.require(:shop).permit(:shop_name, :shop_introduction, :shop_image)
  end
  def product_params
    params.require(:product).permit(:name, :introduction, :price, :image, :amount)
  end
end
