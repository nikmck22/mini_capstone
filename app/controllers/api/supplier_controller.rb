class Api::SupplierController < ApplicationController

  def index
    @supplier = Supplier.all
    render "index.json.jb"
  end
  
end

