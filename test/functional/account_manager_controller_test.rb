require 'test_helper'

class AccountManagerControllerTest < ActionController::TestCase
  test "should get create_private" do
    get :create_private
    assert_response :success
  end

  test "should get create_business" do
    get :create_business
    assert_response :success
  end

  test "should get private" do
    get :private
    assert_response :success
  end

  test "should get business" do
    get :business
    assert_response :success
  end

end
