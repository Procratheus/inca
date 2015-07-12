class ChangeUsersRole < ActiveRecord::Migration
  
  def up
    add_column :users, :roles, :boolean, default: false
  end

  def down
    remove_column :users, :roles
  end

end
