class AddIndexToSharing < ActiveRecord::Migration[5.0]
  def change
    add_index :sharings, [:shareable_type, :shareable_id, :receiver_type, :receiver_id], unique: true, name: 'sharing_idx'
  end
end
