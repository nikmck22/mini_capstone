class Api::ProductsController < ApplicationController

  def items
    render "items.json.jb"
  end

  def query
    @product = Product.find_by(id: 1)
    p @product
    render "query.json.jb"
  end

  def user_name
    @user_guess = params[:user_guess]
    answer = 40
    if answer < 40
      p "too low"
    elsif
      p "too high"
    else
      p "you win!"
    end
    render "body.json.jb"
  end
end
