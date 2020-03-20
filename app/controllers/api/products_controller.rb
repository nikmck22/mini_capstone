class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  def index
      # if params[:discount] == "true"
      #    @products = Product.where("price < 10")
      # else
      #   @products = Product.all.order(:price)
      # end
      # p current_user
    @products = Product.all
    # @products = Supplier.where(supplier_id: id)
    render "index.json.jb"
  end

  # SELECT "products".* FROM "products" ORDER BY "products"."price" ASC
  # SELECT "products".* FROM "products" WHERE (price < 3) LIMIT $1  [["LIMIT", 11]]

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
      description: params[:input_description],
      # user_id: current_user.user_id
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
