class Order < ActiveRecord::Base
  attr_accessible :customer_id, :gst_rate, :hst_rate, :pst_rate, :status
  
  belongs_to :customer
  has_many   :lineItems
  has_many   :products, :through => :lineItems
  
  validates :customer_id, :status, :presence => true
end