require 'json'
require 'open-uri'
require 'nokogiri'

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

  REGEX = /<script type=\"application\/ld\+json\">\n(?<json>.*?\"@type\": \"Product\".*?})\n<\/script>/m

  def scraping
    @barcode = params[:val_barcode]
    url = "https://www.alltricks.fr/Acheter/#{@barcode}"
    html_file = open(url).read
    json = html_file.match(REGEX)[:json].split('<script type="application/ld+json">').last.strip
    data = JSON.parse(json)
    @price = (data['offers'].key?('price') ? data['offers']['price'] : data['offers']['lowPrice'])
    @rating = data['aggregateRating']['ratingValue']
    @rating_count = data['aggregateRating']['reviewCount']
    @name = data['name']
    @image = data['image']
    @url = data ['url']
    @description = data['description']
    @brand = data['brand']['name']
    @html_doc = Nokogiri::HTML(html_file)

  end
end


# if @html_doc.search('.titreconseil').present?
#       redirect_to scan_barcode_path, notice: 'try again'
# else
# end
