require 'test_helper'

class FdItempedidosControllerTest < ActionController::TestCase
  setup do
    @fd_itempedido = fd_itempedidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_itempedidos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_itempedido" do
    assert_difference('FdItempedido.count') do
      post :create, fd_itempedido: { desc_observacao: @fd_itempedido.desc_observacao, fd_empresa_id: @fd_itempedido.fd_empresa_id, fd_funcionario_id: @fd_itempedido.fd_funcionario_id, fd_pedido_id: @fd_itempedido.fd_pedido_id, fd_status_id: @fd_itempedido.fd_status_id, fd_variacaoproduto_id: @fd_itempedido.fd_variacaoproduto_id, tipo_atendimento: @fd_itempedido.tipo_atendimento, valr_item: @fd_itempedido.valr_item }
    end

    assert_redirected_to fd_itempedido_path(assigns(:fd_itempedido))
  end

  test "should show fd_itempedido" do
    get :show, id: @fd_itempedido
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_itempedido
    assert_response :success
  end

  test "should update fd_itempedido" do
    patch :update, id: @fd_itempedido, fd_itempedido: { desc_observacao: @fd_itempedido.desc_observacao, fd_empresa_id: @fd_itempedido.fd_empresa_id, fd_funcionario_id: @fd_itempedido.fd_funcionario_id, fd_pedido_id: @fd_itempedido.fd_pedido_id, fd_status_id: @fd_itempedido.fd_status_id, fd_variacaoproduto_id: @fd_itempedido.fd_variacaoproduto_id, tipo_atendimento: @fd_itempedido.tipo_atendimento, valr_item: @fd_itempedido.valr_item }
    assert_redirected_to fd_itempedido_path(assigns(:fd_itempedido))
  end

  test "should destroy fd_itempedido" do
    assert_difference('FdItempedido.count', -1) do
      delete :destroy, id: @fd_itempedido
    end

    assert_redirected_to fd_itempedidos_path
  end
end
