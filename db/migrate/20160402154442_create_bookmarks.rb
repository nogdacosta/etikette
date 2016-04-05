class CreateBookmarks < ActiveRecord::Migration[5.0]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.string :url
      t.string :tags

      t.timestamps
    end
  end
end
