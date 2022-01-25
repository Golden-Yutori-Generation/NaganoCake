class DeliveryAddress < ApplicationRecord
  belongs_to :member

	validates :member_id, :name, :address, presence: true
	validates :post_code, length: {is: 7}, numericality: { only_integer: true }

  def full_address
    '〒' + post_code + ' ' + address + ' ' + name
  end

end
