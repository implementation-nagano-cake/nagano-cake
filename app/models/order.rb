class Order < ApplicationRecord
  
  has_many :order_details, dependent: :destroy
  belongs_to :customers
  
  validates :customer_id, presence: true
  validates :payment_method, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :address_name, presence: true
  validates :billing_amount, presence: true
  validates :postage, presence: true
end
