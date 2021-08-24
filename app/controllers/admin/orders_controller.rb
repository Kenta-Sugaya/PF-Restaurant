class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!


  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end

  def update
    @order = Order.find(params[:id])
		@order.update(order_status: params[:order][:order_status].to_i)
		if params[:order][:order_status].to_i == 1
		  @order.order_products.update_all(making_status: 1)
		elsif params[:order][:order_status].to_i == 4
		  @order.order_products.update_all(making_status: 3)
		end
		redirect_to admin_order_path(@order.id)
  end

end
