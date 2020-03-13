class Api::ProductsController < ApplicationController
  
  def index
      if params[:search]
        search_name = params[:search]
        @products = Product.where("name LIKE ?", "#{search_name}")
      else
        @products = Product.all
      end
    render "index.json.jb"
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      image_url: params[:input_image_url],
      description: params[:input_description]
    )
    if @product.save
      render "show.json.jb"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:input_name] || @product.name
    @product.price = params[:input_price] || @product.price
    @product.image_url = params[:input_image_url] || @product.image_url
    @product.description = params[:input_description] || @product.description
   
   if @product.save
    render "show.json.jb"
   else
    render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
   end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render "destroy.json.jb"
  end
end
