class AddShippingPostCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipping_post_code, :string
  end
end
