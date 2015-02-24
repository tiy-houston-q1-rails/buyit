class Api::ProductsController < ApplicationController

  protect_from_forgery with: :null_session

  def index
    @products = Product.all
    render json: @products
  end

  def show
    @product = Product.find params[:id]
    render json: @product
  end

  def create
    @product = Product.new params.require(:product).permit(:name, :price, :description, :sku, :remote_photo_url)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: 422
    end
  end

  def update
    @product = Product.find params[:id]
    @product.update params.require(:product).permit(:name, :price, :description, :sku, :remote_photo_url)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: 422
    end
  end

  # {
  #   "product": {
  #     "name": "Bruce Lee",
  #     "sku": "bruce",
  #     "price": 600,
  #     "remote_photo_url": "http://images6.fanpop.com/image/photos/32700000/bruce-lee-bruce-lee-32791998-1200-791.jpg"
  #   }
  # }
end
