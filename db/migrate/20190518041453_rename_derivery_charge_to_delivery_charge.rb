class RenameDeriveryChargeToDeliveryCharge < ActiveRecord::Migration[5.2]
  def change
    rename_table :derivery_charges, :delivery_charges
  end
end
