class ProductController < ApplicationController
  def index
    @products = Product.order(:name)
    @featured_products = Product.all.shuffle[0..2]
  end

  def show
    @product = Product.find(params[:id])
  end
end
