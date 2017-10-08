class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name, null: false
      t.references :room, foreign_key: true
      t.integer :available_time, null: false
      t.integer :price, null: false
      t.text :description, null: true

      t.timestamps
    end
  end
end
