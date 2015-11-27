require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    :activate_authlogic
    Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
    UserSession.create(users(:ben))
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end
  #
  test "should get new" do
    get :new
    assert_response :success
  end
  #
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: {email: 'wthedwed@gmail.com', first_name: 'Ben',
                           last_name: 'Wang', password: '123123123', password_confirmation: '123123123'}
    end
    assert_redirected_to posts_path
  end
  test "should show user" do
    get :show, id: users(:one).id
    assert_response :success
  end
end
