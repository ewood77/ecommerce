class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price, :stock_quantity, :image_path, :category_id
  
  belongs_to :category
  has_many :lineItems
  has_many :orders, :through => :lineItems
  
  validates :description, :name, :price, :stock_quantity, :image_path, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :stock_quantity, :category_id, :numericality => { :only_integer => true }
end