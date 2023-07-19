class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # Configures permitted parameters for the Devise sign-up action
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  # Specifies the path to redirect the user after a successful sign-up
  def after_sign_up_path_for(resource)
    articles_path
  end

  # Specifies the path to redirect the user after a successful sign-in
  def after_sign_in_path_for(resource)
    articles_path
  end
end
