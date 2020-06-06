class ChangeColumnItemForBrandId < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :brand_id, :bigint, null: true, foreign_key: true, index: true
  end

  def down
    change_column :items, :brand_id, :bigint, null: false, foreign_key: true, index: true
  end
end
