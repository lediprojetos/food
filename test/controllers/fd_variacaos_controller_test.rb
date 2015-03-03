require 'test_helper'

class FdVariacaosControllerTest < ActionController::TestCase
  setup do
    @fd_variacao = fd_variacaos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_variacaos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_variacao" do
    assert_difference('FdVariacao.count') do
      post :create, fd_variacao: { desc_variacao: @fd_variacao.desc_variacao, fd_empresa_id: @fd_variacao.fd_empresa_id }
    end

    assert_redirected_to fd_variacao_path(assigns(:fd_variacao))
  end

  test "should show fd_variacao" do
    get :show, id: @fd_variacao
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_variacao
    assert_response :success
  end

  test "should update fd_variacao" do
    patch :update, id: @fd_variacao, fd_variacao: { desc_variacao: @fd_variacao.desc_variacao, fd_empresa_id: @fd_variacao.fd_empresa_id }
    assert_redirected_to fd_variacao_path(assigns(:fd_variacao))
  end

  test "should destroy fd_variacao" do
    assert_difference('FdVariacao.count', -1) do
      delete :destroy, id: @fd_variacao
    end

    assert_redirected_to fd_variacaos_path
  end
end
