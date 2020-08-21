class AddColumnsToUsers3 < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :website, :string
    add_column :users, :profile, :text
    add_column :users, :tel,     :string
    add_column :users, :gender,  :integer
  end
end
