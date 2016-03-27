module StudentUsersHelper
  def student_log_in(user)
    session[:user_id] = user.id
  end

  # find current user in this session
  def student_current_user
    @admin_current_user ||= StudentUser.find_by(id: session[:user_id])
  end

  def student_logged_in?
    !student_current_user.nil? && student_current_user.usertype=="student"
  end
end
