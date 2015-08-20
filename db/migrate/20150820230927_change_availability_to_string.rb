class ChangeAvailabilityToString < ActiveRecord::Migration
  def change
    change_column :contents, :availability, :string
  end
end
