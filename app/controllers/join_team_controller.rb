class JoinTeamController < ApplicationController
  def index
  end
  
  # get the team code
	# check if team code exists in database
	# if it exists, redirect to new student user path
	# if not, throw an error stating invalid team code
  def parse_comments
    team_code = params['team_code']
	
	# result = AdvisorUser.where(team_code: team_code).take
	result = Team.find_by(team_code: team_code)

	if(result == nil) 
		session[:team_code_valid] = false
		redirect_to join_team_index_path
	else 
		session[:team_code_valid] = true
		session[:team_code] = team_code
		redirect_to "/student_users/new?student_level=High"
	end
	
	#redirect_to new_student_user_path
	
    #do your stuff with comments_from_form here
  end
end
