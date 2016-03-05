require 'casclient'
require 'casclient/frameworks/rails/filter'

class SessionsController < ApplicationController
  before_action CASClient::Frameworks::Rails::Filter, :except => [:create, :new]

  def new
  end

  def admin_new
    @email = session[:cas_user] + "@tamu.edu"
    admin = Admin.where(:email => @email).first()
    if admin.nil?
      flash.now[:flash] = 'Invalid Admin user name and password'
      CASClient::Frameworks::Rails::Filter.logout(self)
    else
      render 'admins/home'
    end
  end

  def log_out
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  # Creates session.
  # Searches for admin based on session email.
  # Authenticates using email & password stored in session.
  # If not authenticated, show : invalid email/password combination
  # If Admin does not exist based on session email, retrieve advisor user
  # with that email and authenticate based on email/password combination
  def create
    user = Admin.find_by(email: params[:session][:email].downcase)
    #if params[:session][:email] && params[:session][:email].downcase=="admin@admin.com"
    if user
        if user.authenticate(params[:session][:password])
          flash.now[:flash] = 'Successfully logged in'
          admin_log_in user
          render 'admins/home'
        else
          #create an error message
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
    else
      user = AdvisorUser.find_by(username: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # log the user in and redirect to some page
        flash.now[:flash] = 'Successfully logged in'
        log_in user
        render 'advisor/index'
      else
        #create an error message
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

  def destroy
  end
end
