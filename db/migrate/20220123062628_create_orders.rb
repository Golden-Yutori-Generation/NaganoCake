class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :billing_amount
      t.integer :payment_method
      t.string :shipping_name
      t.text :shipping_address
      t.string :shipping_name
      t.integer :order_status

      t.timestamps
    end
  end
end
