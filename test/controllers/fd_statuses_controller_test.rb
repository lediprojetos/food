require 'test_helper'

class FdStatusesControllerTest < ActionController::TestCase
  setup do
    @fd_status = fd_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_status" do
    assert_difference('FdStatus.count') do
      post :create, fd_status: { desc_status: @fd_status.desc_status, nome_status: @fd_status.nome_status }
    end

    assert_redirected_to fd_status_path(assigns(:fd_status))
  end

  test "should show fd_status" do
    get :show, id: @fd_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_status
    assert_response :success
  end

  test "should update fd_status" do
    patch :update, id: @fd_status, fd_status: { desc_status: @fd_status.desc_status, nome_status: @fd_status.nome_status }
    assert_redirected_to fd_status_path(assigns(:fd_status))
  end

  test "should destroy fd_status" do
    assert_difference('FdStatus.count', -1) do
      delete :destroy, id: @fd_status
    end

    assert_redirected_to fd_statuses_path
  end
end
