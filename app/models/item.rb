class Item < ApplicationRecord
  belongs_to :genre
  has_many :ordered_item
  attachment :item_image

  validates :is_active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :item_image, presence: true
  validates :explanation, presence: true
  validates :no_tax_price, presence: true

  has_many :cart_item, dependent: :destroy

  def with_tax_price
    (no_tax_price * 1.1).floor
  end
end
