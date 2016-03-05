json.array!(@student_users) do |student_user|
  json.extract! student_user, :id, :first_name, :last_name, :school_level, :school_name, :team_name, :pay_code, :team_code
  json.url student_user_url(student_user, format: :json)
end
