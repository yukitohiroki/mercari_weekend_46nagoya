class RenamePointAmountColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :point_amount, :point_id
  end
end
