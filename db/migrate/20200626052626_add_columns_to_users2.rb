class AddColumnsToUsers2 < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :user_name, :string
  end
end
