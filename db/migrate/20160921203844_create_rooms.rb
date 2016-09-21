class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :category
      t.string :description
      t.integer :price
      t.string :identifier

      t.timestamps null: false
    end
    add_index :rooms, :identifier

  end
end
