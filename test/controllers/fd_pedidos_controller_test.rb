require 'test_helper'

class FdPedidosControllerTest < ActionController::TestCase
  setup do
    @fd_pedido = fd_pedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_pedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_pedido" do
    assert_difference('FdPedido.count') do
      post :create, fd_pedido: { fd_cliente_id: @fd_pedido.fd_cliente_id, fd_empresa_id: @fd_pedido.fd_empresa_id, fd_formapagamento_id: @fd_pedido.fd_formapagamento_id, fd_funcionario_id: @fd_pedido.fd_funcionario_id, fd_mesa_id: @fd_pedido.fd_mesa_id, fd_status_id: @fd_pedido.fd_status_id, flag_pago: @fd_pedido.flag_pago, valr_pedido: @fd_pedido.valr_pedido }
    end

    assert_redirected_to fd_pedido_path(assigns(:fd_pedido))
  end

  test "should show fd_pedido" do
    get :show, id: @fd_pedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_pedido
    assert_response :success
  end

  test "should update fd_pedido" do
    patch :update, id: @fd_pedido, fd_pedido: { fd_cliente_id: @fd_pedido.fd_cliente_id, fd_empresa_id: @fd_pedido.fd_empresa_id, fd_formapagamento_id: @fd_pedido.fd_formapagamento_id, fd_funcionario_id: @fd_pedido.fd_funcionario_id, fd_mesa_id: @fd_pedido.fd_mesa_id, fd_status_id: @fd_pedido.fd_status_id, flag_pago: @fd_pedido.flag_pago, valr_pedido: @fd_pedido.valr_pedido }
    assert_redirected_to fd_pedido_path(assigns(:fd_pedido))
  end

  test "should destroy fd_pedido" do
    assert_difference('FdPedido.count', -1) do
      delete :destroy, id: @fd_pedido
    end

    assert_redirected_to fd_pedidos_path
  end
end
