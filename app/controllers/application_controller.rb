class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def reject_non_admin
    unless current_user.admin?
      redirect_to root_path, alert: "管理者以外はアクセスできません。"
    end
  end

  def reject_non_site_manager
    unless current_user.site_manager? || current_user.admin?
      redirect_to root_path, alert: "現場管理者以外はアクセスできません。"
    end
  end
end
