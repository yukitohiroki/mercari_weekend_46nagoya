class CreateThirdCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :third_categories do |t|
      t.integer    :second_category_id, foreign_key: true
      t.string     :third_category,  null:false
      t.timestamps
    end
  end
end
