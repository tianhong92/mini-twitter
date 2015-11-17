json.array!(@users) do |user|
  json.extract! user, :id, :email, :first_name, :last_name, :crypted_password, :password_salt, :persistence_token, :perishable_token, :single_access_token, :login_count, :failed_login_count, :last_request_at, :current_login_at, :last_login_at, :current_login_ip, :last_login_ip, :active, :user_group_id, :activation_token, :password_reset_token
  json.url user_url(user, format: :json)
end
