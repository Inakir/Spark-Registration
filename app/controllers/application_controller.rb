class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include AdminsHelper
  def registration_login
    render :partial => 'partial_name'
    render 'application/registration_login'
  end
end
