require 'test_helper'

class PrivateProfilesControllerTest < ActionController::TestCase
  setup do
    @private_profile = private_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:private_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create private_profile" do
    assert_difference('PrivateProfile.count') do
      post :create, private_profile: { address: @private_profile.address, age: @private_profile.age, gender: @private_profile.gender, image: @private_profile.image, name: @private_profile.name }
    end

    assert_redirected_to private_profile_path(assigns(:private_profile))
  end

  test "should show private_profile" do
    get :show, id: @private_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @private_profile
    assert_response :success
  end

  test "should update private_profile" do
    put :update, id: @private_profile, private_profile: { address: @private_profile.address, age: @private_profile.age, gender: @private_profile.gender, image: @private_profile.image, name: @private_profile.name }
    assert_redirected_to private_profile_path(assigns(:private_profile))
  end

  test "should destroy private_profile" do
    assert_difference('PrivateProfile.count', -1) do
      delete :destroy, id: @private_profile
    end

    assert_redirected_to private_profiles_path
  end
end
