class Public::CartProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @cart_products = current_user.cart_products
    @product = Product.all
  end

  def update
  end

  def create
  end

  def destroy
  end

  def delete_all
    @cart_products = current_user
    @cart_products.delete_all
    redirect_back(fallback_location: public_cart_products_path)
  end
end
