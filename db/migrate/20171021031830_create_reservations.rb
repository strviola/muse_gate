class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.references :plan, foreign_key: true, null: false
      t.references :room, foreign_key: true, null: false
      t.references :player, foreign_key: true, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
