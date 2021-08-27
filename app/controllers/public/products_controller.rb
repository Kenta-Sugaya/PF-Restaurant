class Public::ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.all.order("id ASC")
    @shop = Shop.all
  end

  def show
    @product = Product.find(params[:id])
    @shop = Shop.find(params[:id])
    @favorite = Favorite.new
    @cart_products = CartProduct.new
  end

  private

  def product_params
    params.require(:product).permit(:name, :introduction, :price, :image, :amount)
  end

  def shop_params
    params.require(:shop).permit(:shop_name)
  end
end
