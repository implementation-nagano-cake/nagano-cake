class OrderDetail < ApplicationRecord
  
  belongs_to :items
  belongs_to :orders
  
  validates :item_id, presence: true
  validates :order_id, presence: true
  validates :purchase_price, presence: true
  validates :quantity, presence: true
end
