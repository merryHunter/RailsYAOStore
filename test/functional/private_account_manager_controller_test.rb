require 'test_helper'

class PrivateAccountManagerControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get sell" do
    get :sell
    assert_response :success
  end

  test "should get chat" do
    get :chat
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get my_orders" do
    get :my_orders
    assert_response :success
  end

end
