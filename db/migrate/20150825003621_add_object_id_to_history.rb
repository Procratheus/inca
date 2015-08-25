class AddObjectIdToHistory < ActiveRecord::Migration
  def change
    add_column :histories, :object_id, :integer
  end
end
