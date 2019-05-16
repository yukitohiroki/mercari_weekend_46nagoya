class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer     :amount
      t.integer     :user_id,         foreign_key: true
      t.integer     :point_status_id, foreign_key: true

      t.timestamps
    end
  end
end