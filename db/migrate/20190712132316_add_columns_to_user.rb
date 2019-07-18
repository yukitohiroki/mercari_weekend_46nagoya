class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expert_or_ordinary, :boolean
    add_column :users, :company, :text 
    add_column :users, :job, :text 
    add_column :users, :position, :text 
    add_column :users, :work_year, :integer
    add_column :users, :first_category_id, :integer
    add_column :users, :second_category_id, :integer
    add_column :users, :third_category_id, :integer
  end
end