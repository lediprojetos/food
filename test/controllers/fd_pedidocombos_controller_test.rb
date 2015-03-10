require 'test_helper'

class FdPedidocombosControllerTest < ActionController::TestCase
  setup do
    @fd_pedidocombo = fd_pedidocombos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_pedidocombos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_pedidocombo" do
    assert_difference('FdPedidocombo.count') do
      post :create, fd_pedidocombo: { fd_itempedidos_id: @fd_pedidocombo.fd_itempedidos_id, fd_produtos_id: @fd_pedidocombo.fd_produtos_id }
    end

    assert_redirected_to fd_pedidocombo_path(assigns(:fd_pedidocombo))
  end

  test "should show fd_pedidocombo" do
    get :show, id: @fd_pedidocombo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_pedidocombo
    assert_response :success
  end

  test "should update fd_pedidocombo" do
    patch :update, id: @fd_pedidocombo, fd_pedidocombo: { fd_itempedidos_id: @fd_pedidocombo.fd_itempedidos_id, fd_produtos_id: @fd_pedidocombo.fd_produtos_id }
    assert_redirected_to fd_pedidocombo_path(assigns(:fd_pedidocombo))
  end

  test "should destroy fd_pedidocombo" do
    assert_difference('FdPedidocombo.count', -1) do
      delete :destroy, id: @fd_pedidocombo
    end

    assert_redirected_to fd_pedidocombos_path
  end
end
