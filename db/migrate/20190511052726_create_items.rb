class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer      :user_id,            null:false, foreign_key: true
      t.string       :name,            null:false
      t.integer      :price,           null:false
      t.text         :description,     null:false
      t.integer      :first_category_id,  foreign_key: true
      t.integer      :second_category_id, foreign_key: true
      t.integer      :third_category_id,  foreign_key: true
      t.integer      :brand_id,           foreign_key: true
      t.integer      :size_id,            foreign_key: true
      t.integer      :condition_id,       foreign_key: true
      t.integer      :delivery_charge_id, foreign_key: true
      t.integer      :prefecure_id,       foreign_key: true
      t.integer      :delivery_date_id,   foreign_key: true
      t.integer      :order_status_id,    foreign_key: true
      t.timestamps
    end
  end
end
