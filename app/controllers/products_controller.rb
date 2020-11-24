class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    if params[:query].present?
      @products = Product.where(name: params[:query])
    else
      @products = Product.all
    end
  end

end
