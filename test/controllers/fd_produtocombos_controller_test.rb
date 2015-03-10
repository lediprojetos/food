require 'test_helper'

class FdProdutocombosControllerTest < ActionController::TestCase
  setup do
    @fd_produtocombo = fd_produtocombos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_produtocombos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_produtocombo" do
    assert_difference('FdProdutocombo.count') do
      post :create, fd_produtocombo: { fd_produto_combo: @fd_produtocombo.fd_produto_combo, fd_produtos_id: @fd_produtocombo.fd_produtos_id }
    end

    assert_redirected_to fd_produtocombo_path(assigns(:fd_produtocombo))
  end

  test "should show fd_produtocombo" do
    get :show, id: @fd_produtocombo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_produtocombo
    assert_response :success
  end

  test "should update fd_produtocombo" do
    patch :update, id: @fd_produtocombo, fd_produtocombo: { fd_produto_combo: @fd_produtocombo.fd_produto_combo, fd_produtos_id: @fd_produtocombo.fd_produtos_id }
    assert_redirected_to fd_produtocombo_path(assigns(:fd_produtocombo))
  end

  test "should destroy fd_produtocombo" do
    assert_difference('FdProdutocombo.count', -1) do
      delete :destroy, id: @fd_produtocombo
    end

    assert_redirected_to fd_produtocombos_path
  end
end
