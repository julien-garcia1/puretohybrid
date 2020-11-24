require 'json'
require 'open-uri'

class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    if params[:query].present?
      file = params[:query].gsub(' ', '+')
      filepath = "https://www.alltricks.fr/ajax-autocomplete/#{file}"
      search = open(filepath).read
      results = JSON.parse(search)
      @products = results['product']
    else
      @products = Product.all
    end
  end
end


