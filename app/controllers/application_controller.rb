class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_search
  add_flash_types :success, :info, :warning, :danger
  
  def after_sign_in_path_for(resource) 
    "/users/#{current_user.id}"
  end
  
  def set_search
    @q = User.ransack(params[:q])
    @search_users = @q.result
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :username, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :username, :email, :password, :password_confirmation, :website, :profile, :tel, :gender])
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
