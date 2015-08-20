require 'rails_helper'

RSpec.describe RegistrationsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/users/sign_up').to('registrations#new', {}) }
  it { should route(:post, '/users').to('registrations#create', {}) } 
  it { should route(:get, '/users/edit').to('registrations#edit', {}) }
  it { should route(:patch, '/users').to('registrations#update', {}) } 
  it { should route(:delete, '/users').to('registrations#destroy', {}) } 
  it { should route(:get, '/users/cancel').to('registrations#cancel', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:authenticate_scope!) }
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