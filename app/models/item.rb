class Item < ApplicationRecord
  belongs_to :genre

  validates :is_active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :item_image, presence: true
  validates :explanation, presence: true
  validates :no_tax_price, presence: true
end
