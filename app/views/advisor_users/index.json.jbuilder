json.array!(@advisor_users) do |advisor_user|
  json.extract! advisor_user, :id, :username, :password
  json.url advisor_user_url(advisor_user, format: :json)
end
