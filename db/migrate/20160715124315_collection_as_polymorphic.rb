class CollectionAsPolymorphic < ActiveRecord::Migration[5.0]
  def change
    remove_column :collections, :user_id
    remove_column :collections, :parent_id

    add_reference :collections, :parent, polymorphic: true, index: true
  end
end
