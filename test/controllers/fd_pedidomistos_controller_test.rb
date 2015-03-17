require 'test_helper'

class FdPedidomistosControllerTest < ActionController::TestCase
  setup do
    @fd_pedidomisto = fd_pedidomistos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_pedidomistos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_pedidomisto" do
    assert_difference('FdPedidomisto.count') do
      post :create, fd_pedidomisto: { fd_itempedidos_id: @fd_pedidomisto.fd_itempedidos_id, fd_produto_id: @fd_pedidomisto.fd_produto_id }
    end

    assert_redirected_to fd_pedidomisto_path(assigns(:fd_pedidomisto))
  end

  test "should show fd_pedidomisto" do
    get :show, id: @fd_pedidomisto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_pedidomisto
    assert_response :success
  end

  test "should update fd_pedidomisto" do
    patch :update, id: @fd_pedidomisto, fd_pedidomisto: { fd_itempedidos_id: @fd_pedidomisto.fd_itempedidos_id, fd_produto_id: @fd_pedidomisto.fd_produto_id }
    assert_redirected_to fd_pedidomisto_path(assigns(:fd_pedidomisto))
  end

  test "should destroy fd_pedidomisto" do
    assert_difference('FdPedidomisto.count', -1) do
      delete :destroy, id: @fd_pedidomisto
    end

    assert_redirected_to fd_pedidomistos_path
  end
end
