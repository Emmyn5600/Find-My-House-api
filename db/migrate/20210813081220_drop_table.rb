class DropTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :add_house_to_rents
    drop_table :add_user_to_rents
    drop_table :remove_house_to_rents
  end
end
