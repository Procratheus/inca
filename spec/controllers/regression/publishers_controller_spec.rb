require 'rails_helper'

RSpec.describe PublishersController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/publishers').to('publishers#index', {}) }
  it { should route(:get, '/publishers/1').to('publishers#show', {:id=>"1"}) }
  it { should route(:get, '/publishers/new').to('publishers#new', {}) }
  it { should route(:post, '/publishers').to('publishers#create', {}) } 
  it { should route(:get, '/publishers/1/edit').to('publishers#edit', {:id=>"1"}) }
  it { should route(:patch, '/publishers/1').to('publishers#update', {:id=>"1"}) } 
  it { should route(:delete, '/publishers/1').to('publishers#destroy', {:id=>"1"}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_devise_parameters) }
  it { should use_before_filter(:set_publisher) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  it { should use_after_filter(:verify_authorized) }
  # === Callbacks (Around) ===
  
end