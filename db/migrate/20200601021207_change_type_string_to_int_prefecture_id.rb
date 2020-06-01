class ChangeTypeStringToIntPrefectureId < ActiveRecord::Migration[5.2]
  def up
    change_column :addresses, :prefecture_id, :integer
  end
  def down
    change_column :addresses, :prefecture_id, :string
  end
end
