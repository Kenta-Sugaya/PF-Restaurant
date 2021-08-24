class Public::OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @order.user_id = current_user.id
    @order.save
    Delivery.find_or_create_by(user_id: current_user.id,name: @order.name,address: @order.address,postal_code: @order.postal_code)

    @cart_products = current_user.cart_products
    @cart_products.each do |cart_product|
      if OrderProduct.create(
        product_id: cart_product.product.id,
        order_id: @order.id,
        amount: cart_product.amount,
        price: (cart_product.product.price * 1.1).floor.to_s(:delimited),
        )
        @cart_products.delete_all
        redirect_to public_orders_complete_path
      else
        flash[:danger] = "注文内容に不備があります。"
        redirect_to new_public_user_path
      end
    end
  end

  def confirm #"確認画面へ進む"ボタンを押したときに呼ばれる
    @cart_products = current_user.cart_products
    @order = Order.new(order_params)
    @order.shipping_fee = 800
    @order.payment_method = params[:order][:payment_method]
    @address_option = params[:address_option]

    if @address_option == "0" #選択したお届け先によってカラムに代入するものを変える
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.name = current_user.last_name + current_user.first_name
    elsif @address_option == "1"
      @delivery = Delivery.find(params[:order][:delivery_id])
      @order.postal_code = @delivery.postal_code
      @order.address = @delivery.address
      @order.name = @delivery.name
    elsif @address_option == "2"
      @order.postal_code = params[:address][:postcode]
      @order.address = params[:address][:address]
      @order.name = params[:address][:name]
    end
  end

  def complete

  end

  private
  def order_params
    params.require(:order).permit(:user_id, :postal_code, :address, :name, :shipping_fee, :total_payment, :payment_method, :order_status, :created_at, :updated_at)
  end

end
