require 'test_helper'

class FdUsuariosControllerTest < ActionController::TestCase
  setup do
    @fd_usuario = fd_usuarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_usuarios)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_usuario" do
    assert_difference('FdUsuario.count') do
      post :create, fd_usuario: { data_inclusao: @fd_usuario.data_inclusao, desc_login: @fd_usuario.desc_login, desc_nome: @fd_usuario.desc_nome, desc_perfil: @fd_usuario.desc_perfil, desc_senha: @fd_usuario.desc_senha, fd_empresas_id: @fd_usuario.fd_empresas_id }
    end

    assert_redirected_to fd_usuario_path(assigns(:fd_usuario))
  end

  test "should show fd_usuario" do
    get :show, id: @fd_usuario
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_usuario
    assert_response :success
  end

  test "should update fd_usuario" do
    patch :update, id: @fd_usuario, fd_usuario: { data_inclusao: @fd_usuario.data_inclusao, desc_login: @fd_usuario.desc_login, desc_nome: @fd_usuario.desc_nome, desc_perfil: @fd_usuario.desc_perfil, desc_senha: @fd_usuario.desc_senha, fd_empresas_id: @fd_usuario.fd_empresas_id }
    assert_redirected_to fd_usuario_path(assigns(:fd_usuario))
  end

  test "should destroy fd_usuario" do
    assert_difference('FdUsuario.count', -1) do
      delete :destroy, id: @fd_usuario
    end

    assert_redirected_to fd_usuarios_path
  end
end
