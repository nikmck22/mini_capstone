class Api::OrdersController < ApplicationController
  def create
    order = Order.new(
      product_id: params[:product_id],
      quantity: params[:quantity],
      user_id: params[:user_id]
    )
    @subtotal = 4 * order.quantity
    tax_rate = 0.09
    @tax =  @subtotal * tax_rate 
    @total = @tax + @subtotal

    # p "*" * 88
    # p @total
    # p "*" * 88

    if order.save
      render json: { message: "Order created successfully" }, status: :created
    else
      render json: { errors: order.errors.full_messages }, status: :bad_request
    end
  end
end
