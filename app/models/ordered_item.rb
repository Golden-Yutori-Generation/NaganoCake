class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum order_status: { item_not: 0, wait: 1, middle: 2, comp: 3}
  
  def subtotal
    item.with_tax_price * amount.to_i
  end
end
