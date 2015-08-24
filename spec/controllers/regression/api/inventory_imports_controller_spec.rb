require 'rails_helper'

RSpec.describe Api::InventoryImportsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:put, '/api/inventory_imports/import_all').to('api/inventory_imports#import_all', {}) } 
  it { should route(:put, '/api/inventory_imports/import_delta').to('api/inventory_imports#import_delta', {}) } 
  it { should route(:put, '/api/inventory_imports/import_image_all').to('api/inventory_imports#import_image_all', {}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_devise_parameters) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  it { should use_after_filter(:verify_authorized) }
  # === Callbacks (Around) ===
  
end