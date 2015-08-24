require 'rails_helper'

RSpec.describe Devise::SessionsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/users/sign_in').to('devise/sessions#new', {}) }
  it { should route(:post, '/users/sign_in').to('devise/sessions#create', {}) } 
  it { should route(:delete, '/users/sign_out').to('devise/sessions#destroy', {}) } 
  # === Callbacks (Before) ===
  it { should use_before_filter(:verify_signed_out_user) }
  it { should use_before_filter(:allow_params_authentication!) }
  it { should use_before_filter(:require_no_authentication) }
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