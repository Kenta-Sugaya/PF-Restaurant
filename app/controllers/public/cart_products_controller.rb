class Public::CartProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart_products = current_user.cart_products
    @product = Product.all
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    @ccart_product.update(cart_product_params)
    redirect_to public_cart_products_path
  end

  def create
    @cart_product = CartProduct.new(product_id: params[:product_id])
    @cart_product.user_id = current_user.id
    @cart_product.save
    redirect_to public_cart_products_path
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_back(fallback_location: public_cart_products_path)
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:product_id, :amount, :user_id)
  end
end
