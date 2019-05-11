class CreateSecondCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :second_categories do |t|
      t.integer    :first_category_id,  foreign_key: true
      t.integer    :size_category_id,   foreign_key: true
      t.string     :second_category, null: false
      t.timestamps
    end
  end
end

