class Order < ApplicationRecord
  belongs_to :member
  has_many :ordered_items

  validates :shipping_address, presence: true
  validates :shipping_name, presence: true
  validates :payment_method, presence: true
  validates :shipping_post_code, length: {is: 7}, numericality: { only_integer: true }

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: { maney_wait: 0, maney_confirm: 1, item_middle: 2, item_pre: 3, item_comp: 4}


end
