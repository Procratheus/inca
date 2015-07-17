class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_devise_parameters, if: :devise_controller?

  protected

  def configure_devise_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :roles, :name, :email, :password, :password_confirmation) } 
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit( :roles, :name, :email, :password, :password_confirmation, :current_password) } 
    devise_parameter_sanitizer.for(:accept_invitation) { |u| u.permit( :name, :password, :password_confirmation) } 
  end

  def authenticate_admin_user!
    redirect_to authenticated_root_path, alert: "This resource is restricted to Admin users!" unless current_user.roles
  end

end
