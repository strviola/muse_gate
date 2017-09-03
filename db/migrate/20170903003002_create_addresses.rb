class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.references :prefecture, null: false
      t.string :city, null: false
      t.string :detail, null: false

      t.timestamps
    end
  end
end
