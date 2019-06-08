class CreatePaymentInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_informations do |t|
      t.integer     :user_id,                 null: false, foreign_key: true
      t.text        :card_number,             null:false, unique:true
      t.integer     :valid_year,              null:false
      t.integer     :valid_month,             null:false
      t.integer     :cvc,                     null:false
    end
  end
end
