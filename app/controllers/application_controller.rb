class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  @spotify_user = nil

  def after_sign_out_path
   root_path
  end

  def after_sign_in_path_for(resource)
    statuses_path
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:name, :address]
      devise_parameter_sanitizer.for(:account_update) << [:name, :address, :phone]
    end

    def rspotify_authenticate
      RSpotify.authenticate("e7d5e458e14f4e9ea418dddb9c8b22d0", "dc8ce016ad794c5aa985d3a70b03c799")
    end
end
