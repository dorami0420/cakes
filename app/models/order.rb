class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  has_many :order_details 
    belongs_to :customer
def with_tax_price
    (price * 1.1).floor
end   
    
end

