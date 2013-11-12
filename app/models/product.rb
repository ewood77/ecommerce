class Product < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price, :stock_quantity, :image_path
end
