class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_active_storage_url_options

  


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
     username == ENV["BASIC_AUTH_USER3"] && password == ENV["BASIC_AUTH_PASSWORD3"]
    end
  end

  
  def set_active_storage_url_options
    if Rails.version.to_i >= 6
      ActiveStorage::Current.url_options = request.env
    else
      ActiveStorage::Current.url_options = request.url_options
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthdate])
  end
end
