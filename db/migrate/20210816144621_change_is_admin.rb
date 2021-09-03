class ChangeIsAdmin < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Is_admin, :is_admin
  end
end
