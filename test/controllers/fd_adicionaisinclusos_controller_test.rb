require 'test_helper'

class FdAdicionaisinclusosControllerTest < ActionController::TestCase
  setup do
    @fd_adicionaisincluso = fd_adicionaisinclusos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_adicionaisinclusos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_adicionaisincluso" do
    assert_difference('FdAdicionaisincluso.count') do
      post :create, fd_adicionaisincluso: { fd_intensadicional_id: @fd_adicionaisincluso.fd_intensadicional_id, fd_itempedido_id: @fd_adicionaisincluso.fd_itempedido_id, numr_quantidade: @fd_adicionaisincluso.numr_quantidade }
    end

    assert_redirected_to fd_adicionaisincluso_path(assigns(:fd_adicionaisincluso))
  end

  test "should show fd_adicionaisincluso" do
    get :show, id: @fd_adicionaisincluso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_adicionaisincluso
    assert_response :success
  end

  test "should update fd_adicionaisincluso" do
    patch :update, id: @fd_adicionaisincluso, fd_adicionaisincluso: { fd_intensadicional_id: @fd_adicionaisincluso.fd_intensadicional_id, fd_itempedido_id: @fd_adicionaisincluso.fd_itempedido_id, numr_quantidade: @fd_adicionaisincluso.numr_quantidade }
    assert_redirected_to fd_adicionaisincluso_path(assigns(:fd_adicionaisincluso))
  end

  test "should destroy fd_adicionaisincluso" do
    assert_difference('FdAdicionaisincluso.count', -1) do
      delete :destroy, id: @fd_adicionaisincluso
    end

    assert_redirected_to fd_adicionaisinclusos_path
  end
end
