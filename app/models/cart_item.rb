class CartItem < ApplicationRecord
  
  belongs_to :items
  belongs_to :customers
  
  validates :item_id, presence: true
  validates :customer_id, presence: true
  validates :amount, presence: true
  
  def subtotal
    item.price_including_tax * amount
  end
  
end
