class AddColumnsToContents < ActiveRecord::Migration
  def change
    add_column :contents, :kortext_id, :integer
    add_column :contents, :e_isbn, :string
    add_column :contents, :p_isbn, :string
    add_column :contents, :type, :string
    add_column :contents, :format, :string
    add_column :contents, :title, :string
    add_column :contents, :author, :string
    add_column :contents, :language, :string
    add_column :contents, :pages, :integer
    add_column :contents, :description, :string
    add_column :contents, :imprint, :string
    add_column :contents, :pub_date, :string
    add_column :contents, :price_gbp, :string
    add_column :contents, :price_usd, :string
    add_column :contents, :price_eur, :string
    add_column :contents, :bic, :string
    add_column :contents, :bisac, :string
    add_column :contents, :image, :string
  end
end
