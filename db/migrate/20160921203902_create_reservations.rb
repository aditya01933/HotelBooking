class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.datetime :checkin_at
      t.datetime :checkout_at
      t.integer :advance, default: 0, null: false
      t.integer :amount, default: 0, null: false

      t.timestamps null: false
    end
  end
end
