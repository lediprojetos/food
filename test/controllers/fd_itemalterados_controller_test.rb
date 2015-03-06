require 'test_helper'

class FdItemalteradosControllerTest < ActionController::TestCase
  setup do
    @fd_itemalterado = fd_itemalterados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_itemalterados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_itemalterado" do
    assert_difference('FdItemalterado.count') do
      post :create, fd_itemalterado: { fd_itempedido_id: @fd_itemalterado.fd_itempedido_id, fd_items_id: @fd_itemalterado.fd_items_id, numr_acao: @fd_itemalterado.numr_acao, numr_quntidade: @fd_itemalterado.numr_quntidade }
    end

    assert_redirected_to fd_itemalterado_path(assigns(:fd_itemalterado))
  end

  test "should show fd_itemalterado" do
    get :show, id: @fd_itemalterado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_itemalterado
    assert_response :success
  end

  test "should update fd_itemalterado" do
    patch :update, id: @fd_itemalterado, fd_itemalterado: { fd_itempedido_id: @fd_itemalterado.fd_itempedido_id, fd_items_id: @fd_itemalterado.fd_items_id, numr_acao: @fd_itemalterado.numr_acao, numr_quntidade: @fd_itemalterado.numr_quntidade }
    assert_redirected_to fd_itemalterado_path(assigns(:fd_itemalterado))
  end

  test "should destroy fd_itemalterado" do
    assert_difference('FdItemalterado.count', -1) do
      delete :destroy, id: @fd_itemalterado
    end

    assert_redirected_to fd_itemalterados_path
  end
end
