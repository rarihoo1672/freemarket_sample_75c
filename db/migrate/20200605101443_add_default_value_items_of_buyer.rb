class AddDefaultValueItemsOfBuyer < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :buyer, :integer, default: 0
  end

  def down
    change_column :items, :buyer, :integer, default: nil
  end
end
