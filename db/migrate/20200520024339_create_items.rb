class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :introduction, null: false
      t.string :status, null: false
      t.string :size, null: false
      t.string :shipping_cost, null: false
      t.string :shipping_days, null: false
      t.string :prefecture_id, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :buyer, foreign_key: true     
      t.timestamps
    end
  end
end
