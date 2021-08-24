class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(9)
    p "-------"
    p @products
  end

  def new
    @product = Product.new
    @shop = Shop.find(params[:shop_id])

  end

  def create
    @shop = Shop.find(params[:shop_id])
    @product = @shop.products.new(product_params)
    #@product.shop_id = params[:shop_id]
    if @product.save
      redirect_to admin_products_path
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
      params.require(:product).permit(:name, :image, :introduction, :price, :sales_status, :product_id, :shop_id)
   end
   

end
