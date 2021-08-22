class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = Product.page(params[:page]).per(9)
  end

  def new
    @shop = Shop.find(params[:shop_id])
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]
    if @product.save
      redirect_to admin_shop_products_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
      redirect_to admin_products_path
  end
  
  private

   def product_params
      params.permit(:name, :image, :introduction, :price, :sales_status, :shop_id)
   end
   

end
