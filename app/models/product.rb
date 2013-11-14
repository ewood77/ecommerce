class Product < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price, :stock_quantity, :image_path
  
  has_many :lineItems
  has_many :orders, :through => :lineItems
  
  validates :category, :description, :name, :price, :stock_quantity, :image_path, :presence => true
  validates :price, :numericality => { :greater_than => 0.0 }
  validates :stock_quantity, :numericality => { :only_integer => true }
end
