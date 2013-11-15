class Product < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price, :stock_quantity, :image_path
  
  has_many :lineItems
  has_many :orders, :through => :lineItems
  
  validates :category, :description, :name, :price, :stock_quantity, :image_path, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :stock_quantity, :numericality => { :only_integer => true }
end
