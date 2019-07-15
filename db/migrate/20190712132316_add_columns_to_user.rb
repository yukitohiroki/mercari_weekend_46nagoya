class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expert_or_ordinary, :boolean
    add_column :users, :company, :text ,null: false
    add_column :users, :job, :text ,null: false
    add_column :users, :position, :text ,null: false
    add_column :users, :work_year, :integer ,null: false
    add_column :users, :first_category_id, :integer ,null: false
    add_column :users, :second_category_id, :integer ,null: false
    add_column :users, :third_category_id, :integer ,null: false
  end
end