class RenameColumnToPublisherName < ActiveRecord::Migration
  def change
    rename_column :contents, :publisher, :publisher_name
  end
end
