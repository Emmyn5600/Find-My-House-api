class AddIsAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Is_admin, :boolean
  end
end
