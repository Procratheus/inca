class AddEditionAndPublisherToContents < ActiveRecord::Migration
  def change
    add_column :contents, :edition, :string
    add_column :contents, :publisher, :string
  end
end
