module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end
  # finds current logged in advisor user from the session
  def current_user
    @current_user ||= AdvisorUser.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil? && current_user.usertype=="advisor"
  end

end
