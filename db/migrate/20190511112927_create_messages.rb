class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text        :message
      t.integer     :user_id,         foreign_key: true
      t.integer     :item_id,         foreign_key: true
      t.boolean     :seller,          default: true, null: false
      t.integer     :order_status_id, foreign_key: true
      t.timestamps
    end
  end
end
