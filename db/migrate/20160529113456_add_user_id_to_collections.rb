class AddUserIdToCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :user_id, :integer
    add_index :collections, :user_id
  end
end
