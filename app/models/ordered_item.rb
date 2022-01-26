class OrderedItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum making_status: { item_not: 0, wait: 1, middle: 2, comp: 3}

  def with_tax_price
    (perchace_price * 1.1).floor
  end

  def subtotal
    with_tax_price * amount.to_i
  end
  
  def total_amount
    OrderedItem.all.sum(:amount)
  end
end
