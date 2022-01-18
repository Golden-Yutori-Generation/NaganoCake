class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :no_tax_price
      t.text :item_image_id

      t.timestamps
    end
  end
end
