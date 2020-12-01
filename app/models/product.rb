class Product < ApplicationRecord
  belongs_to :store
  has_many :reviews


  # def self.scrap(barcode)
  #   url = "https://www.alltricks.fr/Acheter/#{barcode}"
  #   html_file = open(url).read
  #   @html_doc = Nokogiri::HTML(html_file)
  # end
end
