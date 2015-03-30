require 'test_helper'

class FdCaixasControllerTest < ActionController::TestCase
  setup do
    @fd_caixa = fd_caixas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_caixas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_caixa" do
    assert_difference('FdCaixa.count') do
      post :create, fd_caixa: { data_abertura: @fd_caixa.data_abertura, data_fechamento: @fd_caixa.data_fechamento, fd_empresa_id: @fd_caixa.fd_empresa_id, numr_contador: @fd_caixa.numr_contador, valor_caixa: @fd_caixa.valor_caixa, valor_fechamento: @fd_caixa.valor_fechamento }
    end

    assert_redirected_to fd_caixa_path(assigns(:fd_caixa))
  end

  test "should show fd_caixa" do
    get :show, id: @fd_caixa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_caixa
    assert_response :success
  end

  test "should update fd_caixa" do
    patch :update, id: @fd_caixa, fd_caixa: { data_abertura: @fd_caixa.data_abertura, data_fechamento: @fd_caixa.data_fechamento, fd_empresa_id: @fd_caixa.fd_empresa_id, numr_contador: @fd_caixa.numr_contador, valor_caixa: @fd_caixa.valor_caixa, valor_fechamento: @fd_caixa.valor_fechamento }
    assert_redirected_to fd_caixa_path(assigns(:fd_caixa))
  end

  test "should destroy fd_caixa" do
    assert_difference('FdCaixa.count', -1) do
      delete :destroy, id: @fd_caixa
    end

    assert_redirected_to fd_caixas_path
  end
end
