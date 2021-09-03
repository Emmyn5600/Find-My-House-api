class AddUserIdToHouses < ActiveRecord::Migration[6.1]
  def change
    add_column :houses, :user_id, :integer
  end
end
