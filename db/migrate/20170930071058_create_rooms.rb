class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.references :host, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description, null: true
      t.references :address, foreign_key: true, null: false
      t.boolean :has_piano, null: false, default: false

      t.timestamps
    end
  end
end
