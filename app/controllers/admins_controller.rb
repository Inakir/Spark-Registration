class AdminsController < ApplicationController
  before_action :set_advisor_user, only: [:show, :edit, :update, :destroy, :editlogin, :changelogin, :changepassword, :editpassword]
  def index
    @admin = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def show
  end

  def edit
  end
  # redirects to admins/changelogin
  def editlogin
    render 'admins/changelogin'
  end
  # renders admins/changepassword
  def editpassword
    render 'admins/changepassword'
  end

  def advisor_edit_method
    
  end

  #Creates admin data based on the admin parameters and redirects to admin home page
  # Admin parameters :
  # identifiers : name,email,phone,fax.
  # urls : right_sig_url,mkt_place_url
  def create
    @admin = Admin.new(admin_params)

    @admin.usertype="admin"

    respond_to do |format|
      if @admin.save
        format.html { render registration_home_index_path, notice: 'Advisor user was successfully created!' }
        format.json { render registration_home_index_path, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  #Updates admin username based on the changes and redirects to admin home page
  # updates other admin attributes - identifiers and urls.
  def update
    respond_to do |format|
      if @admin.update_attribute(:name , params[:admin][:name]) | @admin.update_attribute(:right_sig_url , params[:admin][:right_sig_url]) |
								  @admin.update_attribute(:mkt_place_url , params[:admin][:mkt_place_url]) |
								  @admin.update_attribute(:phone , params[:admin][:phone]) |
								  @admin.update_attribute(:fax , params[:admin][:fax])
						  
        format.html { redirect_to @admin, notice: 'Admin user was successfully updated!' }
        format.json { render :show, status: :ok, location: @admin }

      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updates admin email data based on the changes and redirects to admin home page.
  # Throws out error "Email Invalid" for invalid entries (not following standard template user@domain.com)
  def changelogin
    respond_to do |format|
      if @admin.update_attribute(:email, params[:admin][:email])
      #if @admin.update_attributes(:email => params[:admin][:email])
       format.html { redirect_to @admin, notice: 'Admin email was successfully updated!' }
       format.json { render :show, status: :ok, location: @admin }
     else
       format.html { redirect_to changelogin_admin_path(@admin), notice: 'Email invalid! Must follow  \'user\' @ \'domain\' . \'com\'  standard template' } 
       format.json { render json: @admin.errors, status: :unprocessable_entity }
     end
    end
  end

  # Mark the student as paid.
  def mark_paid
    @student_user = StudentUser.find(params[:id]) #finds correct student
    @student_user.pay_status = "yes"
    @student_user.save(validate: false) #validate: false prevents it from asking for a password upon update
    UserMailer.thanks_email(@student_user.email).deliver_now
    render 'admins/see_info'
  end
  
  #send email to a specific student
  def send_email
    @student_user = StudentUser.find(session[:student_id])
    @subject= params[:subject]
    @text= params[:email_text]
    UserMailer.welcome_email(@student_user.email,@subject,@text).deliver_now
    render 'admins/see_info'
  end
  #send payment email to all unpaid users
  def unpaid_email_group
    @subject= params[:subject]
    @text= params[:email_text]
      StudentUser.all.each do |student|
        if (student.pay_status != "yes")
          UserMailer.welcome_email(student.email,@subject,@text).deliver
        end
      end
       render 'admins/see_info'
  end
  
    def paid_email_group
    @subject= params[:subject]
    @text= params[:email_text]
      StudentUser.all.each do |student|
        if (student.pay_status == "yes")
          UserMailer.welcome_email(student.email,@subject,@text).deliver
        end
      end
       render 'admins/see_info'
  end

  #email_page action
  def email_page
    puts session.inspect
    @student_id= session[:student_id]
    @selector=session[:selector]
  end
  
  def email_unpaid
    session[:selector]="unpaid"
    session[:student_id]= params[:student_id]
    render 'admins/email_page'
  end
  
   def email_paid
    session[:selector]="paid"
    session[:student_id]= params[:student_id]
    render 'admins/email_page'
   end
  
  def send_stud_email
    session[:selector]=""
    session[:student_id]= params[:student_id]
    render 'admins/email_page'
  end
  
  def send_all
    session[:selector]="all"
    render 'admins/email_page'
  end
  
  def edit_email
    @send_to_who = session[:selector]
    @email_text=params[:email_text]
    @subject= params[:subject]
    if @send_to_who == "unpaid"
      unpaid_email_group()
    else if @send_to_who == "paid"
      paid_email_group()
    else if @send_to_who == "all"
      email_all()
    else
      send_email()
    end
    
    end
    
    end
  
  end
  #send email to all users, advisors, and admins
   def email_all
      StudentUser.all.each do |student|
          UserMailer.welcome_email(student.email).deliver
      end
      AdvisorUser.all.each do |advisor|
          UserMailer.welcome_email(advisor.username).deliver
      end
      Admin.all.each do |admin|
          UserMailer.welcome_email(admin.email).deliver
      end
       render 'admins/see_info'
   end
  
  #send email to all advisors
  def email_advisors
      AdvisorUser.all.each do |advisor|
          UserMailer.unpaid_email_groups(advisor.username).deliver
      end
       render 'admins/see_info'
  end

  #Changes password, password must be 6 characters long and match confirmation
  def changepassword
    respond_to do |format|
     if @admin.update(admin_params)
       format.html { redirect_to @admin, notice: 'Admin password was successfully updated!' }
       format.json { render :show, status: :ok, location: @admin }
     else
       format.html { redirect_to changepassword_admin_path(@admin), notice: 'Password must be at least 6 characters long and must match confirmation' } 
       format.json { render json: @admin.errors, status: :unprocessable_entity }
     end
    end
  end

#Delete the admin
  def destroy
    @admin.destroy
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisor_user
      #@admin = Admin.first
      @admin = Admin.find_by_id(params[:id])
    end
    def admin_params
      params.require(:admin).permit(:email, :password, :password_confirmation, :name, :phone, :fax, :right_sig_url, :mkt_place_url)
    end
     def student_user_params
      params.require(:student_user).permit(:first_name, :last_name, :school_level, :password, :pay_status, :password_confirmation, :school_name, :team_name, :pay_code, :team_code, :email)
    end
end