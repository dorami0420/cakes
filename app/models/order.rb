class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  has_many :ordered_items 
    has_many :items, through: :ordered_items  
end
