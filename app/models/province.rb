class Province < ActiveRecord::Base
  attr_accessible :gst, :hst, :name, :pst
  
  has_many :Customers
  
  validates :name,       :presence => true
  validates :pst, :gst,  :presence => true, :if => :pst_province?
  validates :hst,        :presence => true, :if => :hst_province?
  
  def pst_province?
    name == "Manitoba" or
    name == "Saskatchewan" or
    name == "British Columbia" or
    name == "Quebec"
  end
  
  def hst_province?
    name == "Nova Scotia" or
    name == "New Brunswick" or
    name == "Newfoundland and Labrador" or
    name == "Prince Edward Island" or
    name == "Ontario"
  end
end