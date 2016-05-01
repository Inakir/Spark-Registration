require 'casclient'
require 'casclient/frameworks/rails/filter'

class SessionsController < ApplicationController
  #before_action CASClient::Frameworks::Rails::Filter, :check_session, :except => [:create, :new,:new_student, :log_out_students]#, :admin_new,:log_out, :login]

  def new
  end

  # def login
  #     if (session.nil?)
  #       flash[:alert]= "You don't have access"
  #       redirect_to "/registration_home/index"
  #     end
  # end
  
  # def check_permission
  #   if(session[:current_user].nil?)
  #       flash[:alert]= "You Shall Not Pass!"
  #       redirect_to "/registration_home/index"
  #   end
  # end

  # def admin_new
  #   @email = session[:cas_user] + "@tamu.edu"
  #   admin = Admin.where(:email => @email).first()
  #   if admin.nil?
  #     flash.now[:flash] = 'Invalid Admin user name and password'
  #     #CASClient::Frameworks::Rails::Filter.logout(self)
  #   else
  #     render 'admins/home'
  #   end
  # end
  
  def new_student

  end

  def log_out#have to change to check first if user is CAS logged-in first. if not, do regular logout
  #CASClient::Frameworks::Rails::Filter.logout(self)
  #render 'index'
    reset_session
    flash.now[:danger] = 'You have sucessfully Logged Out! :)'
    redirect_to root_path
  end
  
  def log_out_students#logout for non-CAS users aka students/advisors
    reset_session
    flash.now[:danger] = 'You have sucessfully Logged Out! :)'
    redirect_to root_path
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
          session[:admin_current_user]=user.id
          if user.super_admin == true
            @id = session[:user_id]
            session[:super_admin_current_user]=user.id # lets super admin permissions
            redirect_to '/admins/super_admin' 
          else  
            @id = session[:user_id]
            redirect_to '/admins/home'
          end
        
        else
          #create an error message
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
    else #need another else if statement here for student user to authenticate the user.
      user = AdvisorUser.find_by(username: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # log the user in and redirect to some page
        flash.now[:flash] = 'Successfully logged in'
        log_in user
        redirect_to '/advisor/index'
      else
          user=StudentUser.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
              flash.now[:flash] = 'Successfully logged in student'
              student_log_in user
              @student_current_user=user
              redirect_to action: "index", controller: 'student_users', id: user.id
            else
               if(session.nil? || session[:password] = nil || session[:email] = nil)
                  redirect_to "/registration_home/index"
               end
                  #create an error message
              flash.now[:danger] = 'Invalid email/password combination'
              render 'new'
            end
      end
    end
  end

  def destroy
  end
  

end
