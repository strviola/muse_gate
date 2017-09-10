class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.references :account, foreign_key: true
      t.references :address, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
