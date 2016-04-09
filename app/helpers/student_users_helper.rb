module StudentUsersHelper
    def student_current_user
    @student_current_user ||= Student.find_by(id: session[:user_id])
    end

  def student_logged_in?
    !student_current_user.nil? && student_current_user.usertype=="student"
  end
end
