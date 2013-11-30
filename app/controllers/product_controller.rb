class ProductController < ApplicationController
  def index
    @products = Product.order(:name)
    @featured_products = Product.all.shuffle[0..2]
  end

  def show
    @product = Product.find(params[:id])
  end

  def sale
    @sale_products = Product.where(:price => 12.95)
  end

  def new
    @new_products = Product.order(:updated_at).limit(10)
  end
end
