class CreateSharings < ActiveRecord::Migration[5.0]
  def change
    create_table :sharings do |t|
      t.references :shareable, polymorphic: true
      t.references :receiver, polymorphic: true

      t.timestamps
    end
  end
end
