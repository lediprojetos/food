require 'test_helper'

class FdItensprodutosControllerTest < ActionController::TestCase
  setup do
    @fd_itensproduto = fd_itensprodutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_itensprodutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_itensproduto" do
    assert_difference('FdItensproduto.count') do
      post :create, fd_itensproduto: { fd_item_id: @fd_itensproduto.fd_item_id, fd_produto_id: @fd_itensproduto.fd_produto_id }
    end

    assert_redirected_to fd_itensproduto_path(assigns(:fd_itensproduto))
  end

  test "should show fd_itensproduto" do
    get :show, id: @fd_itensproduto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_itensproduto
    assert_response :success
  end

  test "should update fd_itensproduto" do
    patch :update, id: @fd_itensproduto, fd_itensproduto: { fd_item_id: @fd_itensproduto.fd_item_id, fd_produto_id: @fd_itensproduto.fd_produto_id }
    assert_redirected_to fd_itensproduto_path(assigns(:fd_itensproduto))
  end

  test "should destroy fd_itensproduto" do
    assert_difference('FdItensproduto.count', -1) do
      delete :destroy, id: @fd_itensproduto
    end

    assert_redirected_to fd_itensprodutos_path
  end
end
