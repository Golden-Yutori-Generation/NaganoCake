class CreateOrderedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_items do |t|
      t.integer :order_item
      t.integer :item_id
      t.string :amount_integer
      t.integer :perchace_price
      t.integer :making_status

      t.timestamps
    end
  end
end
