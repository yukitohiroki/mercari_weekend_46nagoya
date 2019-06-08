class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column_default :users, :point_amount, 0
  end
  
  def down
    change_column_default :users, :point_amount, nil
  end
end
