class Public::ProductsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:product_id])
    @cart_products = CartProduct.new
  end
  
  private
  def product_params
    params.require(:product).permit(:name, :introduction, :price, :image, :genre_id, :amount)
  end

end
