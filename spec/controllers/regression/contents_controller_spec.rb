require 'rails_helper'

RSpec.describe ContentsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/contents').to('contents#index', {}) }
  it { should route(:get, '/contents/1').to('contents#show', {:id=>"1"}) }
  it { should route(:get, '/contents/new').to('contents#new', {}) }
  it { should route(:post, '/contents').to('contents#create', {}) } 
  it { should route(:get, '/contents/1/edit').to('contents#edit', {:id=>"1"}) }
  it { should route(:patch, '/contents/1').to('contents#update', {:id=>"1"}) } 
  it { should route(:delete, '/contents/1').to('contents#destroy', {:id=>"1"}) } 
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