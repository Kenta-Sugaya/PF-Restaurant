class Public::ShopsController < ApplicationController
before_action :authenticate_user!,except: [:index, :show]
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end
  
  def shop_params
    params.require(:shop).permit(:shop_name, :shop_introduction, :shop_image)
  end
end
