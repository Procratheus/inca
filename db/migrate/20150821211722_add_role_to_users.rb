class AddRoleToUsers < ActiveRecord::Migration
  def up
    remove_column :users, :roles, :string
    add_column :users, :role, :integer, default: 0
  end

  def down
    remove_column :users, :role, :integer
    add_column :users, :roles, :boolean, default: false
  end
end
