require 'test_helper'

class FdProdutosControllerTest < ActionController::TestCase
  setup do
    @fd_produto = fd_produtos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_produtos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_produto" do
    assert_difference('FdProduto.count') do
      post :create, fd_produto: { desc_produto: @fd_produto.desc_produto, fd_categoriaprodutos_id: @fd_produto.fd_categoriaprodutos_id, fd_empresas_id: @fd_produto.fd_empresas_id, fd_usuarios_id: @fd_produto.fd_usuarios_id, nome_produto: @fd_produto.nome_produto, valr_produto: @fd_produto.valr_produto }
    end

    assert_redirected_to fd_produto_path(assigns(:fd_produto))
  end

  test "should show fd_produto" do
    get :show, id: @fd_produto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_produto
    assert_response :success
  end

  test "should update fd_produto" do
    patch :update, id: @fd_produto, fd_produto: { desc_produto: @fd_produto.desc_produto, fd_categoriaprodutos_id: @fd_produto.fd_categoriaprodutos_id, fd_empresas_id: @fd_produto.fd_empresas_id, fd_usuarios_id: @fd_produto.fd_usuarios_id, nome_produto: @fd_produto.nome_produto, valr_produto: @fd_produto.valr_produto }
    assert_redirected_to fd_produto_path(assigns(:fd_produto))
  end

  test "should destroy fd_produto" do
    assert_difference('FdProduto.count', -1) do
      delete :destroy, id: @fd_produto
    end

    assert_redirected_to fd_produtos_path
  end
end
