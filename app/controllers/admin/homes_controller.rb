class Admin::HomesController < ApplicationController
  def top
    @orders = Order.page(params[:id]).per(10).reverse_order
  end
end
