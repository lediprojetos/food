require 'test_helper'

class FdMesasControllerTest < ActionController::TestCase
  setup do
    @fd_mesa = fd_mesas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_mesas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_mesa" do
    assert_difference('FdMesa.count') do
      post :create, fd_mesa: { desc_mesa: @fd_mesa.desc_mesa, fd_empresa_id: @fd_mesa.fd_empresa_id, fd_usuario_id: @fd_mesa.fd_usuario_id, flag_mesaaberta: @fd_mesa.flag_mesaaberta, numr_mesa: @fd_mesa.numr_mesa }
    end

    assert_redirected_to fd_mesa_path(assigns(:fd_mesa))
  end

  test "should show fd_mesa" do
    get :show, id: @fd_mesa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_mesa
    assert_response :success
  end

  test "should update fd_mesa" do
    patch :update, id: @fd_mesa, fd_mesa: { desc_mesa: @fd_mesa.desc_mesa, fd_empresa_id: @fd_mesa.fd_empresa_id, fd_usuario_id: @fd_mesa.fd_usuario_id, flag_mesaaberta: @fd_mesa.flag_mesaaberta, numr_mesa: @fd_mesa.numr_mesa }
    assert_redirected_to fd_mesa_path(assigns(:fd_mesa))
  end

  test "should destroy fd_mesa" do
    assert_difference('FdMesa.count', -1) do
      delete :destroy, id: @fd_mesa
    end

    assert_redirected_to fd_mesas_path
  end
end
