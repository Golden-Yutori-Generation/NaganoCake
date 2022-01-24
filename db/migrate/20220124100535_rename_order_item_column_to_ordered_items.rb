class RenameOrderItemColumnToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :ordered_items, :order_item, :order_id
  end
end
