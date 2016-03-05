class AdvisorUsersController < ApplicationController
  before_action :set_advisor_user, only: [:show, :edit, :update, :destroy]

  # GET /advisor_users
  # GET /advisor_users.json
  def index
    @advisor_users = AdvisorUser.all
  end

  # GET /advisor_users/1
  # GET /advisor_users/1.json
  def show
  end

  # GET /advisor_users/new
  def new
    @advisor_user = AdvisorUser.new
  end

  # GET /advisor_users/1/edit
  def edit
  end
  #Generates a random pay code and checks if it exists in the database
  def genPayCode(seed)
    num = seed.to_i + rand(1000...900000)
    retcode = 'Y' + num.to_s
    done = 0
    # Check to see if the pay_code already exists
    while(done==0)
      # Checks database for code
      if AdvisorUser.where(:pay_code => retcode).blank?	
        done = done + 1 #not in database
      else
        retcode = retcode + 1 #in database, increase and check again
      end
    end
    return retcode
  end
  
  # POST /advisor_users
  # POST /advisor_users.json
  # Creates advisor user based on the parameters and redirects to the advisor home page
  def create
    @advisor_user = AdvisorUser.new(advisor_user_params)

    # generate their paycode if they are paying for students
    @advisor_user.pay_code = genPayCode(@advisor_user.id)

    @advisor_user.usertype="advisor"

    respond_to do |format|
      if @advisor_user.save
        format.html { redirect_to @advisor_user, notice: 'Advisor user was successfully created.' }
        format.json { render :show, status: :created, location: @advisor_user }
      else
        format.html { render :new }
        format.json { render json: @advisor_user.errors, status: :unprocessable_entity }
      end
    end
  end

#Updates the advisor parameters based on the changes and throws out errors for invalid entries
  # PATCH/PUT /advisor_users/1
  # PATCH/PUT /advisor_users/1.json
  def update
    respond_to do |format|
      if @advisor_user.update(advisor_user_params)
        format.html { redirect_to @advisor_user, notice: 'Advisor user was successfully updated.' }
        format.json { render :show, status: :ok, location: @advisor_user }
      else
        format.html { render :edit }
        format.json { render json: @advisor_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advisor_users/1
  # DELETE /advisor_users/1.json
#Deletes the advisor user entry
  def destroy
    @advisor_user.destroy
    if current_user
      respond_to do |format|
        format.html { redirect_to advisor_users_url, notice: 'Advisor user was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
    if admin_current_user
      respond_to do |format|
        format.html { redirect_to '/admins/see_info', notice: 'Advisor user was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advisor_user
      @advisor_user = AdvisorUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advisor_user_params
      params.require(:advisor_user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :school_level, :school_name, :pay_code)
    end
end
