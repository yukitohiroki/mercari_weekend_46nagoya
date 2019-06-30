class CreateCommunications < ActiveRecord::Migration[5.2]
  def change
    create_table :communications do |t|
	    t.text     "message",         limit: 65535
	    t.boolean  "seller_or_buyer"
	    t.datetime "created_at",                    null: false
	    t.datetime "updated_at",                    null: false
	    t.integer  "user_id"
	    t.integer  "item_id"
	    t.integer  "order_status_id"
    end
  end
end
