require 'test_helper'

class FdProdutotrocacombosControllerTest < ActionController::TestCase
  setup do
    @fd_produtotrocacombo = fd_produtotrocacombos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_produtotrocacombos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_produtotrocacombo" do
    assert_difference('FdProdutotrocacombo.count') do
      post :create, fd_produtotrocacombo: { fd_produtocombos_id: @fd_produtotrocacombo.fd_produtocombos_id, fd_produtos_id: @fd_produtotrocacombo.fd_produtos_id }
    end

    assert_redirected_to fd_produtotrocacombo_path(assigns(:fd_produtotrocacombo))
  end

  test "should show fd_produtotrocacombo" do
    get :show, id: @fd_produtotrocacombo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_produtotrocacombo
    assert_response :success
  end

  test "should update fd_produtotrocacombo" do
    patch :update, id: @fd_produtotrocacombo, fd_produtotrocacombo: { fd_produtocombos_id: @fd_produtotrocacombo.fd_produtocombos_id, fd_produtos_id: @fd_produtotrocacombo.fd_produtos_id }
    assert_redirected_to fd_produtotrocacombo_path(assigns(:fd_produtotrocacombo))
  end

  test "should destroy fd_produtotrocacombo" do
    assert_difference('FdProdutotrocacombo.count', -1) do
      delete :destroy, id: @fd_produtotrocacombo
    end

    assert_redirected_to fd_produtotrocacombos_path
  end
end
