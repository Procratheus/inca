require 'rails_helper'

RSpec.describe Devise::InvitationsController, regressor: true do
  # === Routes (REST) ===
  it { should route(:get, '/users/invitation/new').to('devise/invitations#new', {}) }
  it { should route(:post, '/users/invitation').to('devise/invitations#create', {}) } 
  it { should route(:get, '/users/invitation/accept').to('devise/invitations#edit', {}) }
  it { should route(:patch, '/users/invitation').to('devise/invitations#update', {}) } 
  it { should route(:get, '/users/invitation/remove').to('devise/invitations#destroy', {}) }
  # === Callbacks (Before) ===
  it { should use_before_filter(:resource_from_invitation_token) }
  it { should use_before_filter(:require_no_authentication) }
  it { should use_before_filter(:has_invitations_left?) }
  it { should use_before_filter(:authenticate_inviter!) }
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