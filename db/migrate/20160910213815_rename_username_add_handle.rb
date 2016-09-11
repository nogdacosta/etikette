class RenameUsernameAddHandle < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :user_name, :name
    add_column :users, :handle, :string
    add_index :users, :handle, unique: true
  end
end
