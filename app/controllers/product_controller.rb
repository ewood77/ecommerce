class ProductController < ApplicationController
  def index
    @products = Product.order(:name)
    @featured_products = Product.all.shuffle[0..2]
  end
  
  def cfl
    @cfl_products = Product.where(:category_id => 1)
  end
  
  def nfl
    @nfl_products = Product.where(:category_id => 2)
  end
  
  def nba
    @nba_products = Product.where(:category_id => 3)
  end
  
  def mlb
    @mlb_products = Product.where(:category_id => 4)
  end
  
  def nhl
    @nhl_products = Product.where(:category_id => 5)
  end
end
