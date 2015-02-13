require 'test_helper'

class FdEstadosControllerTest < ActionController::TestCase
  setup do
    @fd_estado = fd_estados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_estados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_estado" do
    assert_difference('FdEstado.count') do
      post :create, fd_estado: { nome_estado: @fd_estado.nome_estado, sigla_estado: @fd_estado.sigla_estado }
    end

    assert_redirected_to fd_estado_path(assigns(:fd_estado))
  end

  test "should show fd_estado" do
    get :show, id: @fd_estado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_estado
    assert_response :success
  end

  test "should update fd_estado" do
    patch :update, id: @fd_estado, fd_estado: { nome_estado: @fd_estado.nome_estado, sigla_estado: @fd_estado.sigla_estado }
    assert_redirected_to fd_estado_path(assigns(:fd_estado))
  end

  test "should destroy fd_estado" do
    assert_difference('FdEstado.count', -1) do
      delete :destroy, id: @fd_estado
    end

    assert_redirected_to fd_estados_path
  end
end
