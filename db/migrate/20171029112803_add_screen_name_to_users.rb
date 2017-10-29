class AddScreenNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :screen_name, :string, null: false
    add_index :users, :screen_name
  end
end
