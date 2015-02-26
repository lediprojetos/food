require 'test_helper'

class FdFuncionariosControllerTest < ActionController::TestCase
  setup do
    @fd_funcionario = fd_funcionarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_funcionarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_funcionario" do
    assert_difference('FdFuncionario.count') do
      post :create, fd_funcionario: { data_exclusao: @fd_funcionario.data_exclusao, desc_celular: @fd_funcionario.desc_celular, desc_telefone: @fd_funcionario.desc_telefone, fd_cargo_id: @fd_funcionario.fd_cargo_id, fd_empresa_id: @fd_funcionario.fd_empresa_id, fd_endereco_id: @fd_funcionario.fd_endereco_id, nome_funcionario: @fd_funcionario.nome_funcionario }
    end

    assert_redirected_to fd_funcionario_path(assigns(:fd_funcionario))
  end

  test "should show fd_funcionario" do
    get :show, id: @fd_funcionario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_funcionario
    assert_response :success
  end

  test "should update fd_funcionario" do
    patch :update, id: @fd_funcionario, fd_funcionario: { data_exclusao: @fd_funcionario.data_exclusao, desc_celular: @fd_funcionario.desc_celular, desc_telefone: @fd_funcionario.desc_telefone, fd_cargo_id: @fd_funcionario.fd_cargo_id, fd_empresa_id: @fd_funcionario.fd_empresa_id, fd_endereco_id: @fd_funcionario.fd_endereco_id, nome_funcionario: @fd_funcionario.nome_funcionario }
    assert_redirected_to fd_funcionario_path(assigns(:fd_funcionario))
  end

  test "should destroy fd_funcionario" do
    assert_difference('FdFuncionario.count', -1) do
      delete :destroy, id: @fd_funcionario
    end

    assert_redirected_to fd_funcionarios_path
  end
end
