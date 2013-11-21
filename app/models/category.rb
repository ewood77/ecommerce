class Category < ActiveRecord::Base
  attr_accessible :description, :name
  
  has_many :product
  
  validates :name, :description, :presence => true
end
