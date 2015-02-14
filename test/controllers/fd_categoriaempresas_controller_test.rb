require 'test_helper'

class FdCategoriaempresasControllerTest < ActionController::TestCase
  setup do
    @fd_categoriaempresa = fd_categoriaempresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_categoriaempresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_categoriaempresa" do
    assert_difference('FdCategoriaempresa.count') do
      post :create, fd_categoriaempresa: { nome_categoria: @fd_categoriaempresa.nome_categoria }
    end

    assert_redirected_to fd_categoriaempresa_path(assigns(:fd_categoriaempresa))
  end

  test "should show fd_categoriaempresa" do
    get :show, id: @fd_categoriaempresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_categoriaempresa
    assert_response :success
  end

  test "should update fd_categoriaempresa" do
    patch :update, id: @fd_categoriaempresa, fd_categoriaempresa: { nome_categoria: @fd_categoriaempresa.nome_categoria }
    assert_redirected_to fd_categoriaempresa_path(assigns(:fd_categoriaempresa))
  end

  test "should destroy fd_categoriaempresa" do
    assert_difference('FdCategoriaempresa.count', -1) do
      delete :destroy, id: @fd_categoriaempresa
    end

    assert_redirected_to fd_categoriaempresas_path
  end
end
