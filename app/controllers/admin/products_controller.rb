class Admin::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).per(9)
    @products = Product.all
  end

  def new
    @products = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_admins_products_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end
  
  private

   def product_params
      params.require(:item).permit(:name, :image, :introduction, :price, :sales_status, :product_id)
   end

end
