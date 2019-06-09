class ChangeColumnToPoint < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column_default :points, :amount, 0
    end
    
    def down
      change_column_default :points, :amount, nil
    end
  end
end
