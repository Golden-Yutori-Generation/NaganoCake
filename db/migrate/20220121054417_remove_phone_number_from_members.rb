class RemovePhoneNumberFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :phone_number, :integer
  end
end
