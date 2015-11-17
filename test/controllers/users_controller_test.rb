require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { activation_token: @user.activation_token, active: @user.active, crypted_password: @user.crypted_password, current_login_at: @user.current_login_at, current_login_ip: @user.current_login_ip, email: @user.email, failed_login_count: @user.failed_login_count, first_name: @user.first_name, last_login_at: @user.last_login_at, last_login_ip: @user.last_login_ip, last_name: @user.last_name, last_request_at: @user.last_request_at, login_count: @user.login_count, password_reset_token: @user.password_reset_token, password_salt: @user.password_salt, perishable_token: @user.perishable_token, persistence_token: @user.persistence_token, single_access_token: @user.single_access_token, user_group_id: @user.user_group_id }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { activation_token: @user.activation_token, active: @user.active, crypted_password: @user.crypted_password, current_login_at: @user.current_login_at, current_login_ip: @user.current_login_ip, email: @user.email, failed_login_count: @user.failed_login_count, first_name: @user.first_name, last_login_at: @user.last_login_at, last_login_ip: @user.last_login_ip, last_name: @user.last_name, last_request_at: @user.last_request_at, login_count: @user.login_count, password_reset_token: @user.password_reset_token, password_salt: @user.password_salt, perishable_token: @user.perishable_token, persistence_token: @user.persistence_token, single_access_token: @user.single_access_token, user_group_id: @user.user_group_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
