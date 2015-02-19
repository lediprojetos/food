require 'test_helper'

class FdClientesControllerTest < ActionController::TestCase
  setup do
    @fd_cliente = fd_clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_cliente" do
    assert_difference('FdCliente.count') do
      post :create, fd_cliente: { data_inclusao: @fd_cliente.data_inclusao, data_nascimento: @fd_cliente.data_nascimento, desc_celular: @fd_cliente.desc_celular, desc_cpf: @fd_cliente.desc_cpf, desc_email: @fd_cliente.desc_email, desc_sexo: @fd_cliente.desc_sexo, desc_telefone: @fd_cliente.desc_telefone, fd_empresa_id: @fd_cliente.fd_empresa_id, fd_endereco_id: @fd_cliente.fd_endereco_id, nome_cliente: @fd_cliente.nome_cliente }
    end

    assert_redirected_to fd_cliente_path(assigns(:fd_cliente))
  end

  test "should show fd_cliente" do
    get :show, id: @fd_cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_cliente
    assert_response :success
  end

  test "should update fd_cliente" do
    patch :update, id: @fd_cliente, fd_cliente: { data_inclusao: @fd_cliente.data_inclusao, data_nascimento: @fd_cliente.data_nascimento, desc_celular: @fd_cliente.desc_celular, desc_cpf: @fd_cliente.desc_cpf, desc_email: @fd_cliente.desc_email, desc_sexo: @fd_cliente.desc_sexo, desc_telefone: @fd_cliente.desc_telefone, fd_empresa_id: @fd_cliente.fd_empresa_id, fd_endereco_id: @fd_cliente.fd_endereco_id, nome_cliente: @fd_cliente.nome_cliente }
    assert_redirected_to fd_cliente_path(assigns(:fd_cliente))
  end

  test "should destroy fd_cliente" do
    assert_difference('FdCliente.count', -1) do
      delete :destroy, id: @fd_cliente
    end

    assert_redirected_to fd_clientes_path
  end
end
