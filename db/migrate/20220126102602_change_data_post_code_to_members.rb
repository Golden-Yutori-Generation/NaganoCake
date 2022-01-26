class ChangeDataPostCodeToMembers < ActiveRecord::Migration[5.2]
  def change
    change_column :members, :post_code, :string
  end
end
