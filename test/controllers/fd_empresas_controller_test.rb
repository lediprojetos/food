require 'test_helper'

class FdEmpresasControllerTest < ActionController::TestCase
  setup do
    @fd_empresa = fd_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_empresa" do
    assert_difference('FdEmpresa.count') do
      post :create, fd_empresa: { data_inclusao: @fd_empresa.data_inclusao, desc_celular: @fd_empresa.desc_celular, desc_cnpj: @fd_empresa.desc_cnpj, desc_nomefantasia: @fd_empresa.desc_nomefantasia, desc_razaosocial: @fd_empresa.desc_razaosocial, desc_telefone: @fd_empresa.desc_telefone, fd_categoriaempresa_id: @fd_empresa.fd_categoriaempresa_id, fd_endereco_id: @fd_empresa.fd_endereco_id, nome_responsavel: @fd_empresa.nome_responsavel }
    end

    assert_redirected_to fd_empresa_path(assigns(:fd_empresa))
  end

  test "should show fd_empresa" do
    get :show, id: @fd_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_empresa
    assert_response :success
  end

  test "should update fd_empresa" do
    patch :update, id: @fd_empresa, fd_empresa: { data_inclusao: @fd_empresa.data_inclusao, desc_celular: @fd_empresa.desc_celular, desc_cnpj: @fd_empresa.desc_cnpj, desc_nomefantasia: @fd_empresa.desc_nomefantasia, desc_razaosocial: @fd_empresa.desc_razaosocial, desc_telefone: @fd_empresa.desc_telefone, fd_categoriaempresa_id: @fd_empresa.fd_categoriaempresa_id, fd_endereco_id: @fd_empresa.fd_endereco_id, nome_responsavel: @fd_empresa.nome_responsavel }
    assert_redirected_to fd_empresa_path(assigns(:fd_empresa))
  end

  test "should destroy fd_empresa" do
    assert_difference('FdEmpresa.count', -1) do
      delete :destroy, id: @fd_empresa
    end

    assert_redirected_to fd_empresas_path
  end
end
