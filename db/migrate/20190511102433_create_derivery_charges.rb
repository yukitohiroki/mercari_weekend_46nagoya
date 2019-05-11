class CreateDeriveryCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :derivery_charges do |t|
      t.string     :charge
      t.timestamps
    end
  end
end