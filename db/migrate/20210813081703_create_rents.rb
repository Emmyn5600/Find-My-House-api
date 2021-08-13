class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.integer :house_id

      t.timestamps
    end
  end
end
