class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.string :item_id
      t.string :user_id
      t.string :amount

      t.timestamps
    end
  end
end
