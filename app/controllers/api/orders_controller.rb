class Api::OrdersController < ApplicationController
  def index
    if current_user
      @orders = current_user.orders
      render "index.json.jb"
    else
      render json: {}, status: :unauthorized
    end
  end
  
  def create
    product = Product.find_by(id: params[:product_id])
    subtotal = params[:quantity] * product.price
    tax_rate = 0.09
    tax =  subtotal * tax_rate 
    total = tax + subtotal

    @order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )


    if @order.save
      render "show.json.jb"
    else
      render json: { errors: order.errors.full_messages }, status: :bad_request
    end
  end
end
