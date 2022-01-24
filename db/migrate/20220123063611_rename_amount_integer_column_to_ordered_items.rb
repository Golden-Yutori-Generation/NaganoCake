class RenameAmountIntegerColumnToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :ordered_items, :amount_integer, :amount
  end
end
