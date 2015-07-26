class AddAvailablityToContents < ActiveRecord::Migration
  def change
    add_column :contents, :availability, :integer
  end
end
