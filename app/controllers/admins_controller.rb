class AdminsController < ApplicationController
  before_filter :set_cache_buster
  before_action :check_permission
  before_action :super_check_permission, only: [:new,:index, :edit_urls] 
  
  #GET/admins
  def index
    @admin = Admin.all
  end
  
  #GET/admins/new
  def new
    @admin = Admin.new
  end
  
  #GET/admins/home
  def home
   @id = session[:user_id]
   #params[:id] = session[:user_id]
   #flash[:notice] = "Howdy Yall"
   render 'admins/home'
  end
  
  #GET admins/:id
  def show
     @id = session[:user_id]
     @admin = Admin.find_by(id: @id)
  end
  
  #GET admins/:id/edit
  def edit
  end
  
  def editlogin
     @id = session[:user_id]
     @admin = Admin.find_by(id: @id)
     render 'admins/changelogin'
  end
  
  def update_info
     @id = session[:user_id]
     @admin = Admin.find_by(id: @id)
     render 'admins/update_info'
  end
  
  # renders admins/changepassword
  def editpassword
    @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
    render 'admins/changepassword'
  end
  
  #change marketplace url change_market_url_admin_path
  def edit_urls
    @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
    render 'admins/edit_urls'
  end
  
 #GET admins/super_admin is the view for super admin user
  def super_admin
    @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
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
    @admin_current_user = Admin.find_by(id: session[:admin_current_user])
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_super_admin_path, notice: 'Advisor user was successfully created!' }
        format.json { redirect_to admins_super_admin_path, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  #Updates admin username based on the changes and redirects to admin home page
  # updates other admin attributes - identifiers and urls.
  def update
    @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
    respond_to do |format|
      if @admin.update_attribute(:name , params[:admin][:name]) |
								  @admin.update_attribute(:phone , params[:admin][:phone]) |
								  @admin.update_attribute(:email , params[:admin][:email])
						  
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
    @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
    respond_to do |format|
      if @admin.update_attribute(:name , params[:admin][:name]) | @admin.update_attribute(:right_sig_url , params[:admin][:right_sig_url]) |
								  @admin.update_attribute(:mkt_place_url , params[:admin][:mkt_place_url]) |
								  @admin.update_attribute(:phone , params[:admin][:phone]) |
								  @admin.update_attribute(:email , params[:admin][:email])
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
  
  def mark_unpaid
    @student_user = StudentUser.find(params[:id]) #finds correct student
    @student_user.pay_status = "no"
    @student_user.save(validate: false) #validate: false prevents it from asking for a password upon update
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
  
  #send only emails to admin
  def send_admin_email
    @admin = Admin.find(session[:admin_id])
    @subject= params[:subject]
    @text= params[:email_text]
    UserMailer.welcome_email(@admin.email,@subject,@text).deliver_now
    render 'admins/index'
  end
  
  def send_admin_email_2
    @subject= params[:subject]
    @text= params[:email_text]
      Admin.all.each do |admin|
          UserMailer.welcome_email(admin.email,@subject,@text).deliver
      end
       render 'admins/index'
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
  
  def admin_email
    session[:selector]="admin"
    session[:admin_id]= params[:admin_id]
    render 'admins/email_page'
  end
  
  def admin_email_2
    session[:selector]="admin2"
    session[:admin_id]= params[:admin_id]
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
    else if @send_to_who == "admin2"
      send_admin_email_2()
    else if @send_to_who == "admin"
      send_admin_email()  
    else if @send_to_who == "all"
      email_all()
    else
      send_email()
    end
    
    end
  
    end
    
    end
    
    end
  
  end
  #send email to all users, advisors, and admins
  def email_all
    @subject= params[:subject]
    @text= params[:email_text]
    StudentUser.all.each do |student|
        UserMailer.welcome_email(student.email,@subject,@text).deliver
    end
    AdvisorUser.all.each do |advisor|
        UserMailer.welcome_email(advisor.username,@subject,@text).deliver
    end
    Admin.all.each do |admin|
        UserMailer.welcome_email(admin.email,@subject,@text).deliver
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
  
    def email_unpaid_stud
     StudentUser.all.each do |student|
        if (student.pay_status != "yes")
          UserMailer.thanks_email(student.email).deliver
        end
      end
       render 'admins/see_info'
    end
  
  #Changes password, password must be 6 characters long and match confirmation
  def changepassword
    @id = @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
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

def change_urls
    @id = @id = session[:user_id]
    @admin = Admin.find_by(id: @id)
    respond_to do |format|
     if @admin.update_attribute(:mkt_place_url , params[:admin][:mkt_place_url]) | 
       @admin.update_attribute(:right_sig_url , params[:admin][:right_sig_url])
       format.html { redirect_to @admin, notice: 'URLs were successfully updated!' }
       format.json { render :show, status: :ok, location: @admin }
     else
       format.html { redirect_to edit_urls_admin_path(@admin), notice: 'Enter Valid URLs' } 
       format.json { render json: @admin.errors, status: :unprocessable_entity }
     end
    end
end

#Delete the admin
  def destroy
    @admin = Admin.find_by(id: params[:id])
    @admin.destroy
    respond_to do |format|
      format.html { render 'admins/index' , notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    
  def check_permission
    if (session[:admin_current_user].nil?)
      redirect_to "/registration_home/index"
    end
  end
  
  def super_check_permission
    if(session[:super_admin_current_user].nil?)
      redirect_to "/registration_home/index"
    end
  end
  
  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation, :name, :phone, :fax, :right_sig_url, :mkt_place_url)
  end
    
  def student_user_params
    params.require(:student_user).permit(:first_name, :last_name, :school_level, :password, :pay_status, :password_confirmation, :school_name, :team_name, :pay_code, :team_code, :email)
  end
  
  private
  
    def set_cache_buster
     response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
     response.headers["Pragma"] = "no-cache"
     response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end

end
