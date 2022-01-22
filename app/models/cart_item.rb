class CartItem < ApplicationRecord
  belongs_to :member
  has_many :items

  def subtotal
    item.with_tax_price * amount
  end
end
