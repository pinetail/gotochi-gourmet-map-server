require 'test_helper'

class ShopsFavoritesControllerTest < ActionController::TestCase
  setup do
    @shops_favorite = shops_favorites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shops_favorites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shops_favorite" do
    assert_difference('ShopsFavorite.count') do
      post :create, :shops_favorite => @shops_favorite.attributes
    end

    assert_redirected_to shops_favorite_path(assigns(:shops_favorite))
  end

  test "should show shops_favorite" do
    get :show, :id => @shops_favorite.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @shops_favorite.to_param
    assert_response :success
  end

  test "should update shops_favorite" do
    put :update, :id => @shops_favorite.to_param, :shops_favorite => @shops_favorite.attributes
    assert_redirected_to shops_favorite_path(assigns(:shops_favorite))
  end

  test "should destroy shops_favorite" do
    assert_difference('ShopsFavorite.count', -1) do
      delete :destroy, :id => @shops_favorite.to_param
    end

    assert_redirected_to shops_favorites_path
  end
end
