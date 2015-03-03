require 'test_helper'

class FdCategoriaprodutosControllerTest < ActionController::TestCase
  setup do
    @fd_categoriaproduto = fd_categoriaprodutos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_categoriaprodutos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_categoriaproduto" do
    assert_difference('FdCategoriaproduto.count') do
      post :create, fd_categoriaproduto: { desc_categoria: @fd_categoriaproduto.desc_categoria, father_id: @fd_categoriaproduto.father_id }
    end

    assert_redirected_to fd_categoriaproduto_path(assigns(:fd_categoriaproduto))
  end

  test "should show fd_categoriaproduto" do
    get :show, id: @fd_categoriaproduto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_categoriaproduto
    assert_response :success
  end

  test "should update fd_categoriaproduto" do
    patch :update, id: @fd_categoriaproduto, fd_categoriaproduto: { desc_categoria: @fd_categoriaproduto.desc_categoria, father_id: @fd_categoriaproduto.father_id }
    assert_redirected_to fd_categoriaproduto_path(assigns(:fd_categoriaproduto))
  end

  test "should destroy fd_categoriaproduto" do
    assert_difference('FdCategoriaproduto.count', -1) do
      delete :destroy, id: @fd_categoriaproduto
    end

    assert_redirected_to fd_categoriaprodutos_path
  end
end
