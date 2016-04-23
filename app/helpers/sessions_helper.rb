module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:current_user]= AdvisorUser.find_by(id: session[:user_id])
  end
  # finds current logged in advisor user from the session
  def current_user
    @current_user ||= AdvisorUser.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil? && current_user.usertype=="advisor"
  end
  
  def student_log_in(user)
    session[:user_id] = user.id
    session[:student_current_user]=StudentUser.find_by(id: session[:user_id])
  end

  # find current user in this session
  def student_current_user
    @student_current_user ||= StudentUser.find_by(id: session[:user_id])
  end

  def student_logged_in?
    !student_current_user.nil? && student_current_user.usertype=="student"
  end
end
