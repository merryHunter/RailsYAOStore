require 'test_helper'

class CategoryTreesControllerTest < ActionController::TestCase
  setup do
    @category_tree = category_trees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_trees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_tree" do
    assert_difference('CategoryTree.count') do
      post :create, category_tree: {  }
    end

    assert_redirected_to category_tree_path(assigns(:category_tree))
  end

  test "should show category_tree" do
    get :show, id: @category_tree
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_tree
    assert_response :success
  end

  test "should update category_tree" do
    put :update, id: @category_tree, category_tree: {  }
    assert_redirected_to category_tree_path(assigns(:category_tree))
  end

  test "should destroy category_tree" do
    assert_difference('CategoryTree.count', -1) do
      delete :destroy, id: @category_tree
    end

    assert_redirected_to category_trees_path
  end
end
