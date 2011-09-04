require 'test_helper'

class ShopsRequestsControllerTest < ActionController::TestCase
  setup do
    @shops_request = shops_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shops_request" do
    assert_difference('ShopsRequest.count') do
      post :create, :shops_request => @shops_request.attributes
    end

    assert_redirected_to shops_request_path(assigns(:shops_request))
  end

  test "should show shops_request" do
    get :show, :id => @shops_request.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shops_request.to_param
    assert_response :success
  end

  test "should update shops_request" do
    put :update, :id => @shops_request.to_param, :shops_request => @shops_request.attributes
    assert_redirected_to shops_request_path(assigns(:shops_request))
  end

  test "should destroy shops_request" do
    assert_difference('ShopsRequest.count', -1) do
      delete :destroy, :id => @shops_request.to_param
    end

    assert_redirected_to shops_requests_path
  end
end
