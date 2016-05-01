class StudentUsersController < ApplicationController
  before_filter :set_cache_buster
  before_action :set_student_user, only: [:show, :edit, :update, :destroy]  # add :changepassword, :editpassword, :changelogin, :editlogin
  before_action :check_permission, only: [:show, :edit, :update, :destroy, :index]
  # GET /student_users
  # GET /student_users.json
  def index
    @student_current_user=StudentUser.find_by(id: session[:user_id])
  end
    
  #Get /student_users/generate used to generate csv or excel
  def generate
    @student_users = StudentUser.all
    respond_to do |format|
      format.html
      format.csv { send_data @student_users.to_csv }
      format.xls { send_data @student_users.to_csv(col_sep: "\t") }
    end
  end
  
  # GET /student_users/1
  # GET /student_users/1.json
  def show
    if session[:student_current_user].nil?
      @login= false
    else
      @login=true
    end
  end

  # GET /student_users/new
  def new
    if session[:has_school_lvl].nil? || session[:has_school_lvl]==false
      temp=CGI.parse(URI.parse(request.original_url).query)
      session[:student_level]=temp["student_level"][0]
    end
    @student_user = StudentUser.new
  end

  # GET /student_users/1/edit
  def edit
  end

  # POST /student_users
  # POST /student_users.json
  def create
    @student_user = StudentUser.new(student_user_params)
    
    @student_user.usertype ="student"

  	session[:team_code] = nil
  	session[:team_code_valid] = nil
  	@student_user.school_level=session[:student_level]
  	session[:has_school_lvl]=true
    respond_to do |format|
      if @student_user.save
        session[:has_school_lvl]=false
        session[:register]=@student_user.id
        format.html { redirect_to @student_user, notice: 'Please review this information to ensure it is correct' }
        format.json { render :show, status: :created, location: @student_user }
      else
        format.html { render :new }
        format.json { render json: @student_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_users/1
  # PATCH/PUT /student_users/1.json
  def update
    respond_to do |format|
      if @student_user.update_attribute(:pay_status , params[:student_user][:pay_status]) |
         @student_user.update_attribute(:first_name, params[:student_user][:first_name]) |
         @student_user.update_attribute(:email , params[:student_user][:email]) | 
         @student_user.update_attribute(:password , params[:student_user][:password]) |
         @student_user.update_attribute(:school_name , params[:student_user][:school_name])
        format.html { redirect_to @student_user, notice: 'Student user was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_user }
         #@student_user.save!
      else
        format.html { render :edit }
        format.json { render json: @student_user.errors, status: :unprocessable_entity }
      end
    end
  end
  # changes student password
  def changepassword
    respond_to do |format|
     if @student_user.update(student_user_params)
       format.html { redirect_to @student_user, notice: 'Your password was successfully updated!' }
       format.json { render :show, status: :ok, location: @student_user }
     else
       format.html { redirect_to changepassword_student_path(@student_user), notice: 'Password must be at least 6 characters long and must match confirmation' } 
       format.json { render json: @student_user.errors, status: :unprocessable_entity }
     end
    end
  end

  # DELETE /student_users/1
  # DELETE /student_users/1.json
  def destroy
    @student_user.destroy
    respond_to do |format|
      format.html { redirect_to '/admins/see_info', notice: 'Student user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_user
      @id=params[:id]
      if((session[:register].to_s == @id.to_s || session[:student_current_user].to_s == @id.to_s) || 
        session[:admin_current_user] != nil)
        @student_user = StudentUser.find(params[:id])
      else
        redirect_to "/registration_home/index"
      end
    end
    #checks if users have permission to access actions
    def check_permission
      if ((session[:register].nil? || session[:register]==false) &&
         (session[:student_current_user].nil? || session[:student_current_user]==false) &&
         (session[:admin_current_user].nil? || session[:admin_current_user]==false))
        redirect_to "/registration_home/index"
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def student_user_params
      params.require(:student_user).permit(:first_name, :last_name, :school_level, :password, :pay_status, :password_confirmation, :school_name, :team_name, :pay_code, :team_code, :email)
    end
    #makes browser not cache pages
    def set_cache_buster
     response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
     response.headers["Pragma"] = "no-cache"
     response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end
