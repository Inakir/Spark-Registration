class AdvisorController < ApplicationController
before_filter :set_cache_buster
before_action :check_permission
  
  def index
  end
  #Creates a team based on id of advisor.
  # Updates attributes of advisor and redirects to Advisor homepage
  # team - team name, team code and advisor user id
  def create_team
    new_team_code = genTeamCode(current_user.id)
    team_params = {
        :team_name => params[:teamname],
        :team_code => new_team_code,
        :advisor_users_id => current_user.id,
    }
    team = Team.new(team_params)
    team.save

    current_user.update_attribute( :team_name, params[:teamname] )
    current_user.update_attribute( :team_code, new_team_code)

    flash.now[:flash] = 'Team Created'
    render '/advisor/index'
  end
  # Generates a random pay code and checks if it exists in the database
  # if it exists generate the next paycode
  def genTeamCode(seed)
    existing_pay_code="T"
    num = seed.to_i + rand(10000...900000)
    retcode = existing_pay_code + num.to_s
    done = 0
    # Check to see if the pay_code already exists
    while(done==0)
      # Checks database for code
      if AdvisorUser.where(:team_code => retcode).blank?	
        done = done + 1 #not in database
      else
        retcode = retcode + 1 #in database, increase and check again
      end
    end
    return retcode
  end

  private
    def check_permission # only advisors logged in have permissions to this controller
      if (session[:advisor_current_user].nil?)
        redirect_to "/registration_home/index"
      end
    end
    
    def set_cache_buster
       response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
       response.headers["Pragma"] = "no-cache"
       response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
    end
end
