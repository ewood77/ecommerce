class Customer < ActiveRecord::Base
  attr_accessible :address, :city, :country, :email, :first_name, :last_name, :postal_code, :province_id
  
  belongs_to :Province
  has_many :Orders
  
  validates :address, :city, :country, :email, :first_name, :last_name, :postal_code, :province_id, :presence => true
  validates :province_id, :numericality => { :only_integer => true }
end
