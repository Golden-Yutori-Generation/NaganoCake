class ChangeColumnDefaultToOrderedItems < ActiveRecord::Migration[5.2]
  def change
    change_column_default :ordered_items, :making_status, from: nil, to: "0"
  end
end
