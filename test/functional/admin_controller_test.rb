require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get account_request" do
    get :account_request
    assert_response :success
  end

  test "should get users" do
    get :users
    assert_response :success
  end

  test "should get banners" do
    get :banners
    assert_response :success
  end

end
