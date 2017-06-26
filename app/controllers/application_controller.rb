class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:contact_first_name, :contact_last_name, :company_name, :company_website])
  end
end
