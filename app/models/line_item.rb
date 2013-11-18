class LineItem < ActiveRecord::Base
  attr_accessible :order_id, :price, :product_id, :quantity
  
  belongs_to :order
  belongs_to :product
  
  validates :order_id, :price, :product_id, :quantity, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :quantity, :product_id, :numericality => { :only_integer => true }
end