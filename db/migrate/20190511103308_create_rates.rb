class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.string      :rating
      t.timestamps
    end
  end
end