require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  setup do
    :activate_authlogic
    Authlogic::Session::Base.controller = Authlogic::ControllerAdapters::RailsAdapter.new(self)
    UserSession.create(users(:ben))
    # Post.create(posts(:one))
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:post)
  end
  test "should create post" do
    assert_difference('Post.count') do
      post :create, post: {message: "this is a test"}
    end
  end
  test "should reject post" do
    post :create, post: {email: "this is a test"}
    assert_response 422
  end
  test "should show post" do
    get :show, id: posts(:one).id
    assert_response :success
  end
end
