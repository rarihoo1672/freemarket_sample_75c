class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false
    add_column :users, :user_image, :string
    add_column :users, :introduction, :text
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :lastname_kana, :string, null: false
    add_column :users, :firstname_kana, :string, null: false
    add_column :users, :birth_year, :integer, null: false
    add_column :users, :birth_month, :integer, null: false
    add_column :users, :birth_day, :integer, null: false
  end
end
