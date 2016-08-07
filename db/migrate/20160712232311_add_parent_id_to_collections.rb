class AddParentIdToCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :parent_id, :integer
  end
end
