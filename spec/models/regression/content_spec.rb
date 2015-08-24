require 'rails_helper'

RSpec.describe Content, regressor: true do

  # === Relations ===
  it { is_expected.to belong_to :publisher }
  
  

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :publisher_id }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :kortext_id }
  it { is_expected.to have_db_column :e_isbn }
  it { is_expected.to have_db_column :p_isbn }
  it { is_expected.to have_db_column :type_name }
  it { is_expected.to have_db_column :format }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :author }
  it { is_expected.to have_db_column :language }
  it { is_expected.to have_db_column :pages }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :imprint }
  it { is_expected.to have_db_column :pub_date }
  it { is_expected.to have_db_column :price_gbp }
  it { is_expected.to have_db_column :price_usd }
  it { is_expected.to have_db_column :price_eur }
  it { is_expected.to have_db_column :bic }
  it { is_expected.to have_db_column :bisac }
  it { is_expected.to have_db_column :content_image }
  it { is_expected.to have_db_column :availability }
  it { is_expected.to have_db_column :edition }
  it { is_expected.to have_db_column :publisher_name }
  it { is_expected.to have_db_column :vat }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["publisher_id"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end