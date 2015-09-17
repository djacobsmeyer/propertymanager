class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

   protected

   def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name

    #This allows the attributes to be accessible at sign up.
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :customer_id, :email, :password) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :customer_id) }
   end

end
