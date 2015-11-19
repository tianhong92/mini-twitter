json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :crypted_password, :password_salt, :persistence_token, :login_count,  :last_request_at, :current_login_at, :last_login_at, :current_login_ip, :last_login_ip
  json.url user_url(user, format: :json)
end
