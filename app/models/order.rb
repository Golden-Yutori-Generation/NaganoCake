class Order < ApplicationRecord
  belongs_to :member
  has_many :order_items

  validates :shipping_address, presence: true
  validates :shipping_name, presence: true
  validates :payment_method, presence: true
  validates :shipping_post_code, length: {is: 7}, numericality: { only_integer: true }

  enum payment_method: { credit_card: 0, transfer: 1 }

end
