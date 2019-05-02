class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :provider
      t.string :uid
      t.references :user, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
