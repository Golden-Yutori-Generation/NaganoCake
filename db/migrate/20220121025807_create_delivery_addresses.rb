class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.integer :member_id
      t.string :name
      t.string :post_code
      t.text :address

      t.timestamps
    end
  end
end
