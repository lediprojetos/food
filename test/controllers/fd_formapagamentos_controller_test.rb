require 'test_helper'

class FdFormapagamentosControllerTest < ActionController::TestCase
  setup do
    @fd_formapagamento = fd_formapagamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fd_formapagamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fd_formapagamento" do
    assert_difference('FdFormapagamento.count') do
      post :create, fd_formapagamento: { desc_formapagamento: @fd_formapagamento.desc_formapagamento }
    end

    assert_redirected_to fd_formapagamento_path(assigns(:fd_formapagamento))
  end

  test "should show fd_formapagamento" do
    get :show, id: @fd_formapagamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fd_formapagamento
    assert_response :success
  end

  test "should update fd_formapagamento" do
    patch :update, id: @fd_formapagamento, fd_formapagamento: { desc_formapagamento: @fd_formapagamento.desc_formapagamento }
    assert_redirected_to fd_formapagamento_path(assigns(:fd_formapagamento))
  end

  test "should destroy fd_formapagamento" do
    assert_difference('FdFormapagamento.count', -1) do
      delete :destroy, id: @fd_formapagamento
    end

    assert_redirected_to fd_formapagamentos_path
  end
end
