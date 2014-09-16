class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller? && request.path == "/login"
      "login"
    else
      "application"
    end
  end

  # Overrides Devise's default methods to redirect
  # user after sign-in and sign-out
  def after_sign_in_path_for(resource)
    hotmart_params_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

end
