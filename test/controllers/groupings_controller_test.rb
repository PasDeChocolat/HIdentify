require 'test_helper'

class GroupingsControllerTest < ActionController::TestCase
  setup do
    @grouping = groupings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create grouping" do
    assert_difference('Grouping.count') do
      post :create, grouping: { match_id: @grouping.match_id, name: @grouping.name }
    end

    assert_redirected_to grouping_path(assigns(:grouping))
  end

  test "should show grouping" do
    get :show, id: @grouping
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @grouping
    assert_response :success
  end

  test "should update grouping" do
    patch :update, id: @grouping, grouping: { match_id: @grouping.match_id, name: @grouping.name }
    assert_redirected_to grouping_path(assigns(:grouping))
  end

  test "should destroy grouping" do
    assert_difference('Grouping.count', -1) do
      delete :destroy, id: @grouping
    end

    assert_redirected_to groupings_path
  end
end
