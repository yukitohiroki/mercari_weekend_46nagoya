class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer      :user,            null:false, foreign_key: true
      t.string       :name,            null:false
      t.integer      :price,           null:false
      t.text         :description,     null:false
      t.integer      :first_category,  foreign_key: true
      t.integer      :second_category, foreign_key: true
      t.integer      :third_category,  foreign_key: true
      t.integer      :brand,           foreign_key: true
      t.integer      :size,            foreign_key: true
      t.integer      :condition,       foreign_key: true
      t.integer      :delivery_charge, foreign_key: true
      t.integer      :prefecure,       foreign_key: true
      t.integer      :delivery_date,   foreign_key: true
      t.integer      :order_status,    foreign_key: true
      t.timestamps
    end
  end
end
