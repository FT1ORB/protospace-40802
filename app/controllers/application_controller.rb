class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def set_current_user
    @current_user = current_user if user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :occupation, :position])
  end
end