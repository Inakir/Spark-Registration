class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #catches exceptions 
  rescue_from 'ActionController::InvalidAuthenticityToken' do |exception|
     flash[:alert]= "You are trying to access account information. Please login to do so."
        redirect_to "/registration_home/index"
  end
  
  include SessionsHelper
  include AdminsHelper
  def registration_login
    render :partial => 'partial_name'
    render 'application/registration_login'
  end
end
