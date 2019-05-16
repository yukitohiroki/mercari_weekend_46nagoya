class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer      :user_id,                  null: false, foreign_key: true
      t.integer      :item_id,                  null: false, foreign_key: true
      t.integer      :seller_id,                null: false, foreign_key: true 
      t.string       :first_name_delivery,      null: false
      t.string       :first_name_kana_delivery, null: false
      t.string       :last_name_delivery,       null: false
      t.string       :last_name_kana_delivery,  null: false
      t.integer      :prefecture_id,            foreign_key: true
      t.string       :city_delivery,            null: false
      t.string       :adress_delivery,          null: false
      t.string       :building_delivery
      t.integer      :zip_code_delivery,        null:false
      t.integer      :telephone_delivery
      t.integer      :payment_method
      t.boolean      :user_point,               default: true, null: false
      t.integer      :point
      t.timestamps
    end
  end
end
