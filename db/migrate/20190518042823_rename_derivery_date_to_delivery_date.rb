class RenameDeriveryDateToDeliveryDate < ActiveRecord::Migration[5.2]
  def change
    rename_table :derivery_dates, :delivery_dates
  end
end
