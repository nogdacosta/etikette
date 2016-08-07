class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name
      t.string :description
      t.string :tags
      t.string :categories
      t.timestamps
    end
  end
end
