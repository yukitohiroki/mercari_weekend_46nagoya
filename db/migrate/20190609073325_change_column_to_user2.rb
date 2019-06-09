class ChangeColumnToUser2 < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_default :users, :point_amount, nil
    end
    
    def down
      change_column_default :users, :point_amount, 0
    end
  end
end
