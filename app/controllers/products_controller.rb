class ProductsController < ApplicationController
  def index
    product = Product.all

    render json: product.as_json
  end

  def show
    product = Product.find_by id: params[:id]

    render json: product.as_json
  end

  def create
    product = Product.new(name: params[:name], description: params[:description], price: params[:price])

    render json: product.as_json
  end

  def update
    product = Product.find_by id: params[:id]

    product.name = params[:name] || product.name
    product.description = params[:description] || product.description
    product.price = params[:price] || product.price

    render json: product.as_json if product.save
  end

  def destroy
    product = Product.find_by id: params[:id]

    product.destroy

    render json: {message: "Product Annihilated"} 
  end
end
