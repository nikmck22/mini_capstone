class Api::ProductsController < ApplicationController

  def items
    render "items.json.jb"
  end

end
