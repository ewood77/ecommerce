class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :email, :first_name, :last_name, :postal_code, :province_id
  
  belongs_to :province
  has_many   :orders
  
  validates :address, :city, :email, :first_name, :last_name, :postal_code, :province_id, :presence => true
  validates :province_id, :numericality => { :only_integer => true }
end