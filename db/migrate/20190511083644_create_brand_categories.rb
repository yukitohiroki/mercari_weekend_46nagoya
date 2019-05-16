class CreateBrandCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_categories do |t|
      t.integer     :brand_id,          foreign_key: true
      t.integer     :first_category_id, foreign_key: true
      t.timestamps
    end
  end
end