class ProductController < ApplicationController
  def index
    @products = Product.all
    @featured_products = Product.all.shuffle[0..2]
  end
end
