class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    favorite = @product.favorites.find_by(user_id: current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end
