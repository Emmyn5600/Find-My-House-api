class CreateHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :image

      t.timestamps
    end
  end
end
