require 'rails_helper'

RSpec.describe ConfirmationsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/users/confirmation/new').to('confirmations#new', {}) }
  it { should route(:post, '/users/confirmation').to('confirmations#create', {}) } 
  it { should route(:get, '/users/confirmation').to('confirmations#show', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:assert_is_devise_resource!) }
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