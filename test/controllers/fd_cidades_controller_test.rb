require 'test_helper'

class FdCidadesControllerTest < ActionController::TestCase
  setup do
    @fd_cidade = fd_cidades(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_cidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_cidade" do
    assert_difference('FdCidade.count') do
      post :create, fd_cidade: { fd_estado_id: @fd_cidade.fd_estado_id, nome_cidade: @fd_cidade.nome_cidade }
    end

    assert_redirected_to fd_cidade_path(assigns(:fd_cidade))
  end

  test "should show fd_cidade" do
    get :show, id: @fd_cidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_cidade
    assert_response :success
  end

  test "should update fd_cidade" do
    patch :update, id: @fd_cidade, fd_cidade: { fd_estado_id: @fd_cidade.fd_estado_id, nome_cidade: @fd_cidade.nome_cidade }
    assert_redirected_to fd_cidade_path(assigns(:fd_cidade))
  end

  test "should destroy fd_cidade" do
    assert_difference('FdCidade.count', -1) do
      delete :destroy, id: @fd_cidade
    end

    assert_redirected_to fd_cidades_path
  end
end
