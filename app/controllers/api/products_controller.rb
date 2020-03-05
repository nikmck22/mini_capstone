class Api::ProductsController < ApplicationController

  def items
    render "items.json.jb"
  end

  def query
    @product = Product.find_by(id: 1)
    p @product
    render "query.json.jb"
  end
end
