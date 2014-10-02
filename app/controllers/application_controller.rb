class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "login"
    else
      "application"
    end
  end

  # Overrides Devise's default methods to redirect
  # user after sign-in and sign-out
  def after_sign_in_path_for(resource)
    current_user.admin? ?
      hotmart_params_path :
      edit_hotmart_api_key_path(current_user.hotmart_api_key.first.id)
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  # script_api_path is defined inside ApplicationHelper module
  helper_method :script_api_path

end
