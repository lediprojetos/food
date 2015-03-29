require 'test_helper'

class FdEntregasControllerTest < ActionController::TestCase
  setup do
    @fd_entrega = fd_entregas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_entregas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_entrega" do
    assert_difference('FdEntrega.count') do
      post :create, fd_entrega: { fd_pedido_id: @fd_entrega.fd_pedido_id, valr_entrega: @fd_entrega.valr_entrega }
    end

    assert_redirected_to fd_entrega_path(assigns(:fd_entrega))
  end

  test "should show fd_entrega" do
    get :show, id: @fd_entrega
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_entrega
    assert_response :success
  end

  test "should update fd_entrega" do
    patch :update, id: @fd_entrega, fd_entrega: { fd_pedido_id: @fd_entrega.fd_pedido_id, valr_entrega: @fd_entrega.valr_entrega }
    assert_redirected_to fd_entrega_path(assigns(:fd_entrega))
  end

  test "should destroy fd_entrega" do
    assert_difference('FdEntrega.count', -1) do
      delete :destroy, id: @fd_entrega
    end

    assert_redirected_to fd_entregas_path
  end
end
