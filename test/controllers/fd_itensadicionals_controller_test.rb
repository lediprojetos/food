require 'test_helper'

class FdItensadicionalsControllerTest < ActionController::TestCase
  setup do
    @fd_itensadicional = fd_itensadicionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_itensadicionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_itensadicional" do
    assert_difference('FdItensadicional.count') do
      post :create, fd_itensadicional: { fd_categoriaproduto_id: @fd_itensadicional.fd_categoriaproduto_id, fd_item_id: @fd_itensadicional.fd_item_id, valr_item: @fd_itensadicional.valr_item }
    end

    assert_redirected_to fd_itensadicional_path(assigns(:fd_itensadicional))
  end

  test "should show fd_itensadicional" do
    get :show, id: @fd_itensadicional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_itensadicional
    assert_response :success
  end

  test "should update fd_itensadicional" do
    patch :update, id: @fd_itensadicional, fd_itensadicional: { fd_categoriaproduto_id: @fd_itensadicional.fd_categoriaproduto_id, fd_item_id: @fd_itensadicional.fd_item_id, valr_item: @fd_itensadicional.valr_item }
    assert_redirected_to fd_itensadicional_path(assigns(:fd_itensadicional))
  end

  test "should destroy fd_itensadicional" do
    assert_difference('FdItensadicional.count', -1) do
      delete :destroy, id: @fd_itensadicional
    end

    assert_redirected_to fd_itensadicionals_path
  end
end
