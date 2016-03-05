module AdminsHelper

  def admin_log_in(user)
    session[:user_id] = user.id
  end

  # find current user in this session
  def admin_current_user
    @admin_current_user ||= Admin.find_by(id: session[:user_id])
  end

  def admin_logged_in?
    !admin_current_user.nil? && admin_current_user.usertype=="admin"
  end

end
