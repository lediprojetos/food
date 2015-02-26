require 'test_helper'

class FdCargosControllerTest < ActionController::TestCase
  setup do
    @fd_cargo = fd_cargos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_cargos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_cargo" do
    assert_difference('FdCargo.count') do
      post :create, fd_cargo: { data_exclusao: @fd_cargo.data_exclusao, desc_cargo: @fd_cargo.desc_cargo, fd_empresa_id: @fd_cargo.fd_empresa_id, nome_cargo: @fd_cargo.nome_cargo }
    end

    assert_redirected_to fd_cargo_path(assigns(:fd_cargo))
  end

  test "should show fd_cargo" do
    get :show, id: @fd_cargo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_cargo
    assert_response :success
  end

  test "should update fd_cargo" do
    patch :update, id: @fd_cargo, fd_cargo: { data_exclusao: @fd_cargo.data_exclusao, desc_cargo: @fd_cargo.desc_cargo, fd_empresa_id: @fd_cargo.fd_empresa_id, nome_cargo: @fd_cargo.nome_cargo }
    assert_redirected_to fd_cargo_path(assigns(:fd_cargo))
  end

  test "should destroy fd_cargo" do
    assert_difference('FdCargo.count', -1) do
      delete :destroy, id: @fd_cargo
    end

    assert_redirected_to fd_cargos_path
  end
end
