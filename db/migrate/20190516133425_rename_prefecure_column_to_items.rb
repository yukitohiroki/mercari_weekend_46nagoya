class RenamePrefecureColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :prefecure_id, :prefecture_id
  end
end
