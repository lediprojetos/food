require 'test_helper'

class FdVariacaoprodutosControllerTest < ActionController::TestCase
  setup do
    @fd_variacaoproduto = fd_variacaoprodutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_variacaoprodutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_variacaoproduto" do
    assert_difference('FdVariacaoproduto.count') do
      post :create, fd_variacaoproduto: { fd_produto_id: @fd_variacaoproduto.fd_produto_id, fd_variaco_id: @fd_variacaoproduto.fd_variaco_id, valr_produto: @fd_variacaoproduto.valr_produto }
    end

    assert_redirected_to fd_variacaoproduto_path(assigns(:fd_variacaoproduto))
  end

  test "should show fd_variacaoproduto" do
    get :show, id: @fd_variacaoproduto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_variacaoproduto
    assert_response :success
  end

  test "should update fd_variacaoproduto" do
    patch :update, id: @fd_variacaoproduto, fd_variacaoproduto: { fd_produto_id: @fd_variacaoproduto.fd_produto_id, fd_variaco_id: @fd_variacaoproduto.fd_variaco_id, valr_produto: @fd_variacaoproduto.valr_produto }
    assert_redirected_to fd_variacaoproduto_path(assigns(:fd_variacaoproduto))
  end

  test "should destroy fd_variacaoproduto" do
    assert_difference('FdVariacaoproduto.count', -1) do
      delete :destroy, id: @fd_variacaoproduto
    end

    assert_redirected_to fd_variacaoprodutos_path
  end
end
