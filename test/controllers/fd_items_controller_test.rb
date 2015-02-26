require 'test_helper'

class FdItemsControllerTest < ActionController::TestCase
  setup do
    @fd_item = fd_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_item" do
    assert_difference('FdItem.count') do
      post :create, fd_item: { data_exclusao: @fd_item.data_exclusao, desc_item: @fd_item.desc_item, fd_empresa_id: @fd_item.fd_empresa_id }
    end

    assert_redirected_to fd_item_path(assigns(:fd_item))
  end

  test "should show fd_item" do
    get :show, id: @fd_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_item
    assert_response :success
  end

  test "should update fd_item" do
    patch :update, id: @fd_item, fd_item: { data_exclusao: @fd_item.data_exclusao, desc_item: @fd_item.desc_item, fd_empresa_id: @fd_item.fd_empresa_id }
    assert_redirected_to fd_item_path(assigns(:fd_item))
  end

  test "should destroy fd_item" do
    assert_difference('FdItem.count', -1) do
      delete :destroy, id: @fd_item
    end

    assert_redirected_to fd_items_path
  end
end
