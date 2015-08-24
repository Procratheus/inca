require 'rails_helper'

RSpec.describe Publisher, regressor: true do

  # === Relations ===
  
  
  it { is_expected.to have_many :contents }

  # === Nested Attributes ===
  

  # === Database (Columns) ===
  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :name }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }
  it { is_expected.to have_db_column :address }
  it { is_expected.to have_db_column :contract_start_date }
  it { is_expected.to have_db_column :contract_end_date }

  # === Database (Indexes) ===
  it { is_expected.to have_db_index ["name"] }

  # === Validations (Length) ===
  

  # === Validations (Presence) ===
  

  # === Validations (Numericality) ===
  

  
  # === Enums ===
  
  
end