json.array!(@users) do |user|
  json.extract! user, :email, :first_name, :last_name, :role, :password, :password_confirmation
  json.url user_url(user, format: :json)
end