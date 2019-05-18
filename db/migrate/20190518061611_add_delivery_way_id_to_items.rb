class AddDeliveryWayIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :delivery_way_id, :integer
  end
end
