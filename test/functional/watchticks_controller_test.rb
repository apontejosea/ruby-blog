require 'test_helper'

class WatchticksControllerTest < ActionController::TestCase
  setup do
    @watchtick = watchticks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:watchticks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create watchtick" do
    assert_difference('Watchtick.count') do
      post :create, watchtick: { tick: @watchtick.tick }
    end

    assert_redirected_to watchtick_path(assigns(:watchtick))
  end

  test "should show watchtick" do
    get :show, id: @watchtick
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @watchtick
    assert_response :success
  end

  test "should update watchtick" do
    put :update, id: @watchtick, watchtick: { tick: @watchtick.tick }
    assert_redirected_to watchtick_path(assigns(:watchtick))
  end

  test "should destroy watchtick" do
    assert_difference('Watchtick.count', -1) do
      delete :destroy, id: @watchtick
    end

    assert_redirected_to watchticks_path
  end
end
