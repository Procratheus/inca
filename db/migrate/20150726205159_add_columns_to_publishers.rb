class AddColumnsToPublishers < ActiveRecord::Migration
  def change
    add_column :publishers, :address, :string
    add_column :publishers, :contract_start_date, :datetime
    add_column :publishers, :contract_end_date, :datetime
  end
end
