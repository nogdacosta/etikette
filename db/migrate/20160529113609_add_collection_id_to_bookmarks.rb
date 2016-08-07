class AddCollectionIdToBookmarks < ActiveRecord::Migration[5.0]
  def change
    add_column :bookmarks, :collection_id, :integer
    add_index :bookmarks, :collection_id
  end
end
