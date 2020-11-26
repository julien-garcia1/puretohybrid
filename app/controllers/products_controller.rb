require 'json'
require 'open-uri'

class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def index
    if params[:query].present?
      file = params[:query].gsub(' ', '+').mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s
      filepath = "https://www.alltricks.fr/ajax-autocomplete/#{file}"
      search = open(filepath).read
      results = JSON.parse(search)
      @products = results['product']
    else
      @products = Product.all
    end
  end

  def scan
  end

  def barcode
  end

end


