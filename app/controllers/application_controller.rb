class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_customer

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_home_path
    when @customer
      posts_path
    else
      posts_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def set_customer
    @customer = current_customer if customer_signed_in?
  end
end
