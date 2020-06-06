class RemoveBrandIdFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :brand_id
      end

  def down
    add_column :items, :brand_id, :bigint, null: true, foreign_key: true, index: true
  end
end
