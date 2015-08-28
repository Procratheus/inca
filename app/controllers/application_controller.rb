class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Record History
  include RecordHistory

  # Pundit
  include Pundit
  after_action :verify_authorized, unless: :devise_controller?, except: :datatable_ajax_content
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Devise methods
  before_action :authenticate_user!
  before_action :configure_devise_parameters, if: :devise_controller?

  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :roles, :name, :email, :password, :password_confirmation, :profile_image, :remove_profile_image, :profile_image_cache_id) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :roles, :name, :email, :password, :password_confirmation, :current_password, :profile_image, :remove_profile_image, :profile_image_cache_id) }
    devise_parameter_sanitizer.for(:accept_invitation) { |u| u.permit( :name, :password, :password_confirmation, :invitation_token, :profile_image, :remove_profile_image, :profile_image_cache_id) }
  end

  def authenticate_admin_user!
    redirect_to authenticated_root_path, alert: "This resource is restricted to Admin users!" unless current_user.role == "admin"
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || unauthenticated_root_path)
  end


end
