class CreateSecondCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :second_categories do |t|
      t.integer    :first_category,  foreign_key:ture
      t.integer    :size_category,   foreign_key:ture
      t.string     :second_category, null: false
      t.timestamps
    end
  end
end

