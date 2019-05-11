class CreateDeriveryDates < ActiveRecord::Migration[5.2]
  def change
    create_table :derivery_dates do |t|
      t.string      :date
      t.timestamps
    end
  end
end
