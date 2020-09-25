class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname, :family_name, :name, :pronuciation_family_name, :pronuciation_name, :birth_date])
  end
  
end
