class RenameTypeToTypeName < ActiveRecord::Migration
  def change
    rename_column :contents, :type, :type_name
  end
end
