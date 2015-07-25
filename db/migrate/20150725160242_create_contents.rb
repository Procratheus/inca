class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :publisher, index: true

      t.timestamps null: false
    end
    add_foreign_key :contents, :publishers
  end
end
