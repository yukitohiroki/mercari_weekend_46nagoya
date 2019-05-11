class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string      :brand,             unique: true
      t.integer     :first_category_id, foreign_key: true
      t.timestamps
    end
  end
end