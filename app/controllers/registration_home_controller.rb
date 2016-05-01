class RegistrationHomeController < ApplicationController
  def index #logs everyone out and is used on GET registration_home/index
    reset_session
  end
end