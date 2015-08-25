class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user, index: true, foreign_key: true
      t.string :object_name
      t.string :attribute_name
      t.string :before_value
      t.string :after_value

      t.timestamps null: false
    end
  end
end
