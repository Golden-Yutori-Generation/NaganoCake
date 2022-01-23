class ChangeDataTypeAmountOfOrderedItems < ActiveRecord::Migration[5.2]
  def change
    change_column :ordered_items, :amount, :integer
  end
end
