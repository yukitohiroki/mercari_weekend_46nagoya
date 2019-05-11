class CreateProfits < ActiveRecord::Migration[5.2]
  def change
    create_table :profits do |t|
      t.integer     :profit
      t.integer     :user_id,         foreign_key: true
      t.integer     :item_id,         foreign_key: true
      t.datetime    :expiration_date
      t.boolean     :profit_is_vaild, default: true, null: false
      t.timestamps
    end
  end
end