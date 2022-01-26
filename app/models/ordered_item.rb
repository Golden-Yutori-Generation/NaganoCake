class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum order_status: { item_not: 0, wait: 1, middle: 2, comp: 3}

  def subtotal
    with_tax_price * amount.to_i
  end
  
  def with_tax_price
    (perchace_price * 1.1).floor
  end
  
end
