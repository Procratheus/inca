class AddVatToContents < ActiveRecord::Migration
  def change
    add_column :contents, :vat, :string
  end
end
