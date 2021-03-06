require 'rails_helper'

RSpec.describe Devise::PasswordsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/users/password/new').to('devise/passwords#new', {}) }
  it { should route(:post, '/users/password').to('devise/passwords#create', {}) } 
  it { should route(:get, '/users/password/edit').to('devise/passwords#edit', {}) }
  it { should route(:patch, '/users/password').to('devise/passwords#update', {}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:require_no_authentication) }
  it { should use_before_filter(:assert_is_devise_resource!) }
  it { should use_before_filter(:verify_authenticity_token) }
  it { should use_before_filter(:set_xhr_redirected_to) }
  it { should use_before_filter(:set_request_method_cookie) }
  it { should use_before_filter(:authenticate_user!) }
  it { should use_before_filter(:configure_devise_parameters) }
  it { should use_before_filter(:assert_reset_token_passed) }
  # === Callbacks (After) ===
  it { should use_after_filter(:abort_xdomain_redirect) }
  it { should use_after_filter(:verify_same_origin_request) }
  it { should use_after_filter(:verify_authorized) }
  # === Callbacks (Around) ===
  
end